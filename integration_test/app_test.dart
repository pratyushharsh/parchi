import 'dart:io';

import 'package:Parchi/main.dart' as app;
import 'package:Parchi/src/module/create_new_receipt/new_recipt_desktop_view.dart';
import 'package:Parchi/src/module/item_search/item_search_view.dart';
import 'package:Parchi/src/module/landing/landing_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';


takeScreenshot(tester, binding) async {
  if (kIsWeb) {
    await binding.takeScreenshot('test-screenshot');
    return;
  } else if (Platform.isAndroid) {
    await binding.convertFlutterSurfaceToImage();
    await tester.pumpAndSettle();
  }
  await binding.takeScreenshot('test-screenshot');
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('end-to-end test', () {
    testWidgets('Test For Landing Screen', (tester) async {
      await app.main();
      await tester.pumpAndSettle();
      await tester.pumpAndSettle();

      // await tester.enterText(find.byType(type), )
      await tester.tap(find.byType(Page1Button));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key("Page2Button")));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key("Page3Button")));
      await tester.pumpAndSettle();

      // Add Username
      await tester.enterText(
          find.byKey(const Key("phoneOrEmailWidget")), "9430123120");
      await tester.pumpAndSettle();

      // Enter the Sign In Button
      await tester.tap(find.byKey(const Key("signInButton")));
      await tester.pumpAndSettle();

      // Add the otp entered
      await tester.enterText(find.byType(TextField).at(0), "6");
      await tester.enterText(find.byType(TextField).at(1), "6");
      await tester.enterText(find.byType(TextField).at(2), "6");
      await tester.enterText(find.byType(TextField).at(3), "6");
      await tester.enterText(find.byType(TextField).at(4), "6");
      await tester.enterText(find.byType(TextField).at(5), "6");
      await tester.pumpAndSettle();

      // await tester.enterText(find.byType(OTPTextField), "6");
      // await tester.enterText(find.byType(OTPTextField), "6");
      // await tester.enterText(find.byType(OTPTextField), "6");
      // await tester.enterText(find.byType(OTPTextField), "6");
      // await tester.enterText(find.byType(OTPTextField), "6");

      await tester.tap(find.byKey(const Key("verifyOtpButton")));
      await tester.pumpAndSettle();

      try {
        await tester.tap(find.byType(Checkbox).last);
        await tester.pumpAndSettle();
      } catch (e) {
        print(e);
      }

      // Very the user device
      await tester.tap(find.byKey(const Key("removeDeviceButton")));
      await tester.pumpAndSettle();

      // List<Element> fab = find.byType(Radio<String>).allCandidates.toList();

      // Find the
      await tester.tap(find.byType(Radio<String>).last);
      await tester.pumpAndSettle();

      // choose business button
      await tester.tap(find.byKey(const Key("chooseBusinessButton")));
      await tester.pumpAndSettle();

      // Create a new sale
      await Future.delayed(const Duration(seconds: 3));

      // Create 20 sales

      for (int i = 0; i < 5; i++) {
        // createNewSaleButton
        await tester.tap(find.byKey(const Key("createNewSaleButton")));
        await tester.pumpAndSettle();

        // searchSaleProductBar
        for (int i = 1; i <= 4; i++) {
          // searchAndAddItem
          await tester.tap(find.byKey(const Key("searchAndAddItem")));
          await tester.pumpAndSettle();

          await tester.enterText(
              find.byKey(const Key("searchSaleProductBar")), "100$i");
          await tester.pumpAndSettle();

          // Select the first item
          await tester.tap(find.byType(SearchItemResultCard).first);
          await tester.pumpAndSettle();
        }

        // Acept Payment Button
        await tester.tap(find.byKey(const Key("saleInvoiceProceedToPay")));
        await tester.pumpAndSettle();

        // Click on the first tender
        await tester.tap(find.byType(TenderListDisplayCard).first);
        await tester.pumpAndSettle();

        // Click on the first tender
        await tester.tap(find.byKey(const Key("acceptPayment")));
        await tester.pumpAndSettle();

        // Click on the print invoice
        await tester.tap(find.byKey(const Key("printInvoiceButton")));
        await tester.pumpAndSettle();
      }

      // // Verify the counter starts at 0.
      // expect(find.text('0'), findsOneWidget);
      //
      // // Finds the floating action button to tap on.
      // final Finder fab = find.byTooltip('Increment');
      //
      // // Emulate a tap on the floating action button.
      // await tester.tap(fab);
      //
      // // Trigger a frame.
      // await tester.pumpAndSettle();
      //
      // // Verify the counter increments by 1.
      // expect(find.text('1'), findsOneWidget);
    });
  });
}
