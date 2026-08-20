import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loggi_app/app/data/api/inventory_movement_request.dart';
import 'package:loggi_app/app/data/api/inventory_vo.dart';
import 'package:loggi_app/app/data/api/warehouse_request.dart';
import 'package:loggi_app/app/data/api/warehouse_vo.dart';
import 'package:loggi_app/app/data/repositories/warehouse_repository.dart';
import 'package:loggi_app/features/warehouse/widgets/inventory_record_dialog.dart';
import 'package:loggi_app/l10n/l10n.dart';

/// A repository that records what it was asked to do.
///
/// Implemented rather than mocked, matching the style of the network tests: what these
/// cases assert is the request that leaves the dialog, so the double has to hold onto it.
class _RecordingRepository implements WarehouseRepository {
  final List<({InventoryMovementRequest movement, bool inbound})> moves = [];

  @override
  Future<void> move(
    InventoryMovementRequest movement, {
    required bool inbound,
  }) async {
    moves.add((movement: movement, inbound: inbound));
  }

  @override
  Future<List<InventoryVo>> inventoryOf(String warehouseId) async => const [];

  @override
  Future<List<WarehouseVo>> list() async => const [];

  @override
  Future<void> add(WarehouseRequest warehouse) async {}
}

const _options = [
  InventoryOption(commodityId: 'cm-1', name: '精密機器'),
  InventoryOption(commodityId: 'cm-2', name: '冷蔵食品'),
];

Future<void> _pump(
  WidgetTester tester,
  _RecordingRepository repository, {
  List<InventoryOption> options = _options,
  InventoryDirection direction = InventoryDirection.inbound,
}) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [warehouseRepositoryProvider.overrideWithValue(repository)],
      child: MaterialApp(
        // The dialog reads its labels from AppLocalizations now, so a test that does not
        // register the delegate gets a null back and throws inside build. Registering it
        // also means these cases assert against the same strings a user sees.
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('zh'),
        home: Scaffold(
          body: InventoryRecordDialog(
            direction: direction,
            warehouseId: 'wh-1',
            options: options,
          ),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

/// Settles the frame, then drains the toast's timer.
///
/// `showTextToast` schedules a one-second timer that outlives `pumpAndSettle`, and a test
/// that ends with one pending fails on the timer rather than on its assertions.
Future<void> _settle(WidgetTester tester) async {
  await tester.pumpAndSettle();
  await tester.pump(const Duration(seconds: 2));
}

void main() {
  setUp(() {
    // The toast is a plugin channel with nothing behind it in a test.
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('PonnamKarthik/fluttertoast'),
          (_) async => null,
        );
  });

  testWidgets('the first commodity is already selected when the form opens', (
    tester,
  ) async {
    // The defect this pins: the commodity id used to be written only by the dropdown's
    // onChanged, and a dropdown renders its first item without firing it. Opening the form
    // and pressing 确认 sent an empty id under a dropdown that was plainly showing one, and
    // the server answered 400 商品不能为空.
    final repository = _RecordingRepository();
    await _pump(tester, repository);

    await tester.enterText(find.widgetWithText(TextFormField, '数量'), '5');
    await tester.tap(find.widgetWithText(ElevatedButton, '确认'));
    await _settle(tester);

    expect(repository.moves, hasLength(1));
    expect(repository.moves.single.movement.commodityId, 'cm-1');
    expect(repository.moves.single.movement.count, 5);
    expect(repository.moves.single.inbound, isTrue);
  });

  testWidgets('nothing is sent without a quantity', (tester) async {
    final repository = _RecordingRepository();
    await _pump(tester, repository);

    await tester.tap(find.widgetWithText(ElevatedButton, '确认'));
    await _settle(tester);

    expect(repository.moves, isEmpty);
  });

  testWidgets('the direction decides the path, not the body', (tester) async {
    final repository = _RecordingRepository();
    await _pump(tester, repository, direction: InventoryDirection.outbound);

    await tester.enterText(find.widgetWithText(TextFormField, '数量'), '3');
    await tester.tap(find.widgetWithText(ElevatedButton, '确认'));
    await _settle(tester);

    expect(repository.moves.single.inbound, isFalse);
  });

  testWidgets('a warehouse holding nothing says so instead of crashing', (
    tester,
  ) async {
    // The screen this replaces took `.first` of the empty list, inside a `.then`, so it
    // landed in `.onError` and the whole inventory view became "A error occurred: null".
    // A warehouse created a minute ago is in this state.
    final repository = _RecordingRepository();
    await _pump(tester, repository, options: const []);

    expect(find.text('该仓库暂无库存可出库'), findsOneWidget);
    expect(find.byType(DropdownButtonFormField<InventoryOption>), findsNothing);
  });

  testWidgets('one dialog serves both directions', (tester) async {
    final repository = _RecordingRepository();
    await _pump(tester, repository);
    expect(find.text('入库登记'), findsOneWidget);

    await _pump(tester, repository, direction: InventoryDirection.outbound);
    expect(find.text('出库登记'), findsOneWidget);
  });
}
