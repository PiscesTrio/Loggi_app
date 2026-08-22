import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loggi_app/app/data/api/distribution_vo.dart';
import 'package:loggi_app/app/data/api/driver_summary.dart';
import 'package:loggi_app/app/data/api/vehicle_summary.dart';
import 'package:loggi_app/app/data/api/warehouse_summary.dart';
import 'package:loggi_app/app/data/api/driver_vo.dart';
import 'package:loggi_app/app/data/api/login_log_vo.dart';
import 'package:loggi_app/app/data/api/vehicle_vo.dart';
import 'package:loggi_app/app/modules/widgets/distribution_card.dart';
import 'package:loggi_app/app/modules/widgets/driver_card.dart';
import 'package:loggi_app/app/modules/widgets/login_log.dart';
import 'package:loggi_app/app/modules/login/login_title.dart';
import 'package:loggi_app/app/modules/widgets/vehicle_card_min.dart';
import 'package:loggi_app/l10n/app_localizations.dart';

/// Widgets that hold text, rendered in every language, asserting nothing overflows.
///
/// This exists because of a defect it would have caught. The delivery card's status pill was
/// three `Container`s with `width: 70` — enough for 等待审核 and 審査待ち, and 38 logical pixels
/// short of "Awaiting review". Flutter draws that as a yellow-and-black stripe across the
/// card, so it is not subtle; it was simply never on a screen, because until the language
/// switch existed there was no way to render an English one.
///
/// The ARB tests could not have caught it. They assert that a string exists, differs between
/// languages and carries the right placeholders — all of which "Awaiting review" does. Length
/// is a property of the pair (string, box), and only laying it out can measure that.
///
/// There are two failure modes and they need different assertions. A Row that runs out of
/// width reports a RenderFlex error and paints a yellow stripe, which `takeException` sees.
/// A `Center` inside a fixed-width `Container` just draws less: no error, no stripe, and the
/// English "Available" quietly became "Availab" on the driver and vehicle cards. The second
/// is worse for being silent, so it is checked by asking every laid-out paragraph whether it
/// had to drop anything.
void main() {
  // Without this every glyph in a test is a fixed 1em box, so a Latin string measures about
  // twice what Nunito actually draws and a CJK one about half. The login subtitle is the
  // widest thing here and it is Latin, so the difference is the difference between a test
  // that describes the device and one that does not: "Logistics Management System" is 1093dp
  // in the placeholder font and 273dp in Nunito at 20px.
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final loader = FontLoader('Nunito');
    for (final name in [
      'Nunito-Regular.ttf',
      'Nunito-Bold.ttf',
      'Nunito-Light.ttf',
    ]) {
      final bytes = File('lib/assets/fonts/Nunito/$name').readAsBytesSync();
      loader.addFont(Future.value(ByteData.view(bytes.buffer)));
    }
    await loader.load();
  });

  DistributionVo order(DistributionVoStatusEnum status) => DistributionVo(
    id: 'd1',
    status: status,
    driver: DriverSummary(id: 'dr1', name: '田中 三郎', phone: '090-0000-0001'),
    vehicle: VehicleSummary(id: 'v1', number: '品川800へ12-34'),
    warehouse: WarehouseSummary(id: 'w1', name: '名古屋港倉庫'),
    address: '北海道札幌市白石区ロギ8-1-1',
    care: DistributionVoCareEnum.values.toList(),
    urgent: true,
  );

  Future<void> render(WidgetTester tester, Locale locale, Widget child) async {
    await tester.pumpWidget(
      MaterialApp(
        locale: locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(body: child),
      ),
    );
    await tester.pump();
  }

  /// True when any text on screen was cut off — the silent failure.
  void expectNothingTruncated(WidgetTester tester, Locale locale) {
    final clipped = <String>[
      for (final p in tester.renderObjectList<RenderParagraph>(
        find.byType(RichText),
      ))
        if (p.didExceedMaxLines) p.text.toPlainText(),
    ];
    expect(clipped, isEmpty, reason: 'truncated in $locale');
  }

  VehicleVo vehicle() => VehicleVo(
    id: 'v1',
    number: '品川800へ12-34',
    type: VehicleVoTypeEnum.HEAVY_TRUCK,
    driving: false,
  );

  DriverVo driver() => DriverVo(
    id: 'dr1',
    name: '田中 三郎',
    phone: '090-0000-0001',
    gender: DriverVoGenderEnum.MALE,
    license: '第一種大型',
    driving: false,
  );

  /// The subtitle as the app would say it, read from the generated localisations rather
  /// than copied here — a copy would keep passing after someone changed the ARB.
  String subtitleOf(Locale locale) =>
      lookupAppLocalizations(locale).loginSubtitle;

  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('the fleet and log badges are not truncated in $locale', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(720, 1280);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      for (final widget in <Widget>[
        SizedBox(
          width: 360,
          height: 220,
          child: VehicleMinCard(vehicle: vehicle()),
        ),
        SizedBox(
          width: 720,
          height: 220,
          child: DriverCard(driver: driver(), imageIndex: 0),
        ),
        SizedBox(
          width: 720,
          child: LoginLogsTtem(
            loginLog: LoginLogVo(
              id: 'l1',
              email: 'demo@loggi.example',
              status: 1,
            ),
          ),
        ),
      ]) {
        await render(tester, locale, widget);
        expect(tester.takeException(), isNull, reason: 'overflow in $locale');
        expectNothingTruncated(tester, locale);
      }
    });

    testWidgets('the login title stays on two lines in $locale', (
      tester,
    ) async {
      // The device reports 720x1280 at density 240, which is a devicePixelRatio of 1.5 and
      // therefore 480 logical pixels wide — not 720. The rest of this file assumes 720
      // logical and so gives every widget half again the width it really gets; that is a
      // laxer test, not a wrong one, for the fixed-width boxes those cases were written
      // against. It matters here because this widget's width is the thing being asserted.
      tester.view.physicalSize = const Size(720, 1280);
      tester.view.devicePixelRatio = 1.5;
      addTearDown(tester.view.reset);

      // 648 is the width the title actually gets: a full-width Column inside
      // `EdgeInsets.symmetric(horizontal: 36)`. Handing it 720 would let a string 72px too
      // wide pass here and wrap on the device.
      await render(
        tester,
        locale,
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 36),
          child: Align(alignment: Alignment.topLeft, child: LoginTitle()),
        ),
      );

      expect(
        tester.takeException(),
        isNull,
        reason: 'the login title overflows in $locale',
      );
      expectNothingTruncated(tester, locale);

      // The assertion that does the work. `Text` wraps rather than overflowing, so a
      // subtitle too wide for the screen raises no exception and reports no truncation —
      // it silently becomes two lines, and the title block reads as three.
      //
      // Line count is the property. Height is not: height also moves when someone changes
      // the font size, so an assertion on height fails saying "it wrapped" about a line
      // that did not wrap. That draft existed, and Japanese at 40px was its false positive
      // — one line, 57px tall, reported as wrapping against a 40px threshold.
      final subtitle = tester.renderObject<RenderParagraph>(
        find.text(subtitleOf(locale)),
      );
      // One line, measured against itself: the same span laid out with no width limit is
      // one line by definition, so equal heights mean the on-screen one did not wrap.
      // Taking the span from the render object rather than rebuilding a TextStyle here
      // keeps the two in step if the widget's style changes.
      final unwrapped = TextPainter(
        text: subtitle.text,
        textDirection: TextDirection.ltr,
      )..layout();
      expect(
        subtitle.size.height,
        unwrapped.height,
        reason:
            'the subtitle wrapped in $locale — ${subtitle.size.height}px against '
            '${unwrapped.height}px for a single line, so the title reads as three '
            'lines instead of two',
      );
    });

    for (final status in DistributionVoStatusEnum.values) {
      testWidgets('a $status delivery card fits in $locale', (tester) async {
        // The real device is 720 logical pixels wide; the card is drawn to that.
        tester.view.physicalSize = const Size(720, 1280);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.reset);

        await render(
          tester,
          locale,
          DistributionCard(distribution: order(status)),
        );

        // takeException() is how a RenderFlex overflow surfaces in a test: the framework
        // reports it as a FlutterError rather than throwing where the widget is built.
        expect(
          tester.takeException(),
          isNull,
          reason: 'the card overflows in $locale at $status',
        );
      });
    }
  }
}
