import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loggi_app/app/data/api/driver_request.dart';
import 'package:loggi_app/app/data/api/driver_vo.dart';
import 'package:loggi_app/app/data/api/vehicle_request.dart';
import 'package:loggi_app/app/data/api/vehicle_vo.dart';
import 'package:loggi_app/app/data/repositories/fleet_repository.dart';
import 'package:loggi_app/app/modules/driver_list/view.dart';
import 'package:loggi_app/l10n/l10n.dart';

/// A fleet repository that records the drivers it was asked to register.
class _RecordingFleet implements FleetRepository {
  final List<DriverRequest> registered = [];
  int driverLoads = 0;

  @override
  Future<void> addDriver(DriverRequest driver) async => registered.add(driver);

  @override
  Future<List<DriverVo>> drivers() async {
    driverLoads++;
    return const [];
  }

  @override
  Future<void> addVehicle(VehicleRequest vehicle) async {}

  @override
  Future<List<VehicleVo>> vehicles() async => const [];
}

Future<void> _pump(WidgetTester tester, _RecordingFleet fleet) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [fleetRepositoryProvider.overrideWithValue(fleet)],
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('ja'),
        home: const DriverListPage(),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

/// Settles, then drains the toast's one-second timer so it cannot fail the test afterwards.
Future<void> _settle(WidgetTester tester) async {
  await tester.pumpAndSettle();
  await tester.pump(const Duration(seconds: 2));
}

void main() {
  testWidgets('a filled-in form registers the driver and reloads the list', (
    tester,
  ) async {
    final fleet = _RecordingFleet();
    await _pump(tester, fleet);
    final loadsBefore = fleet.driverLoads;

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    expect(find.text('ドライバーを登録'), findsOneWidget);

    final fields = find.byType(TextFormField);
    await tester.enterText(fields.at(0), '佐藤 健');
    await tester.enterText(fields.at(1), '090-1234-5678');
    await tester.enterText(fields.at(2), 'L-2026-001');
    await tester.tap(find.byType(ElevatedButton));
    await _settle(tester);

    expect(fleet.registered, hasLength(1));
    final sent = fleet.registered.single;
    expect(sent.name, '佐藤 健');
    expect(sent.phone, '090-1234-5678');
    expect(sent.license, 'L-2026-001');
    // The list behind the dialog is fetched again, so the new driver shows up on it.
    expect(fleet.driverLoads, greaterThan(loadsBefore));
    expect(find.text('ドライバーを登録'), findsNothing);
  });

  testWidgets('a missing phone number is caught before anything is sent', (
    tester,
  ) async {
    final fleet = _RecordingFleet();
    await _pump(tester, fleet);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextFormField).at(0), '佐藤 健');
    await tester.tap(find.byType(ElevatedButton));
    await _settle(tester);

    expect(fleet.registered, isEmpty);
    // The dialog stays open for the reader to finish it.
    expect(find.text('ドライバーを登録'), findsOneWidget);
  });
}
