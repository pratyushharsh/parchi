import 'package:flutter/material.dart';
import '../../src/model/model.dart';
import '../../src/module/all_customer/all_customer_view.dart';
import '../../src/module/business/bloc/business_bloc.dart';
import '../../src/module/business/business_view.dart';
import '../../src/module/create_new_item/add_new_item_view.dart';
import '../../src/module/create_new_receipt/new_receipt_view.dart';
import '../../src/module/employee_detail/employee_detail_view.dart';
import '../../src/module/home/home_view.dart';
import '../../src/module/invoice/invoice_view.dart';
import '../../src/module/list_all_item/list_all_item_view.dart';
import '../../src/module/list_all_receipt/list_all_receipt_view.dart';
import '../../src/module/load_item_bulk/load_item_bulk_view.dart';
import '../../src/module/locale/locale_view_mobile.dart';
import '../../src/module/order_summary/order_summary_view.dart';
import '../../src/module/receipt_display/receipt_display_view.dart';
import '../../src/module/receipt_setting/receipt_setting_view.dart';
import '../../src/module/splash_screen/splash_screen_view.dart';
import '../../src/module/tax/create_edit_tax.dart';

import '../entity/pos/employee_entity.dart';
import '../module/about/about_view.dart';
import '../module/bulk_import/bulk_import_view.dart';
import '../module/create_edit_customer/create_edit_customer_view.dart';
import '../module/create_new_item/modify_line_item_screen.dart';
import '../module/deals/create_edit_deals.dart';
import '../module/employee/employee_list_view.dart';
import '../module/receipt_display/invoice_display.dart';
import '../module/receipt_setting/invoice_setting_view.dart';
import '../module/sequence/create_edit_sequence_view.dart';

class RouteConfig {

  static const String splashScreen = "/";
  static const String aboutScreen = "/about";
  static const String homeScreen = "/home";
  static const String editItemScreen = "/edit-item";
  static const String editSaleLineItemScreen = "/edit-sale-line-item";
  static const String allItemsScreen = "/list-items";
  static const String allReceiptScreen = "/list-receipt";
  static const String allCustomerScreen = "/all-customer";
  static const String loadItemsInBulkScreen = "/load-in-bulk";
  static const String createReceiptScreen = "/create-receipt";
  static const String createReturnReceiptScreen = "/return-receipt";
  static const String receiptDisplayScreen = "/receipt-display";
  static const String invoiceDisplayScreen = "/invoice-display";
  static const String invoiceViewScreen = "/invoice-view";
  static const String businessViewScreen = "/business-view";
  static const String receiptSettingViewScreen = "/receipt-setting";
  static const String invoiceSettingViewScreen = "/invoice-setting";
  static const String customerDetailScreen = "/customer-detail";
  static const String orderSummaryScreen = "/order-summary";
  static const String localeScreen = "/locale-screen";
  static const String taxConfigurationScreen = "/tax-config";
  static const String employeeDetailScreen = "/employee-detail";
  static const String employeeScreen = "/employee";
  static const String sequenceConfigScreen = "/sequence-config";
  static const String bulkImportScreen = "/bulk-import";
  static const String createDealScreen = "/deals";


  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case aboutScreen:
        return MaterialPageRoute(builder: (_) => const AboutScreen());
      case editItemScreen:
        var pId = settings.arguments;
        if (pId is String) {
          return MaterialPageRoute(builder: (_) => AddNewItemScreen(productId: pId,));
        }
        return MaterialPageRoute(builder: (_) => const AddNewItemScreen());
      case allItemsScreen:
        return MaterialPageRoute(builder: (_) => const AllProductsList());
      case allReceiptScreen:
        return MaterialPageRoute(builder: (_) => const ListAllReceiptView());
      case allCustomerScreen:
        return MaterialPageRoute(builder: (_) => const AllCustomerView());
      case loadItemsInBulkScreen:
        return MaterialPageRoute(builder: (_) => const LoadItemInBulk());
      case createReceiptScreen:
        var transId = settings.arguments as String?;
        return MaterialPageRoute(builder: (_) => NewReceiptView(transId: transId,));
      case createReturnReceiptScreen:
        var transId = settings.arguments as String?;
        return MaterialPageRoute(builder: (_) => const NewReceiptView(isReturn: true,));
      case invoiceViewScreen:
        return MaterialPageRoute(builder: (_) => const InvoiceView());
      case businessViewScreen:
        var bId = settings.arguments;
        if (bId is int) {
          return MaterialPageRoute(builder: (_) => BusinessView(operation: BusinessOperation.update, businessId: bId,));
        }
        return MaterialPageRoute(builder: (_) => const BusinessView());
      case receiptSettingViewScreen:
        return MaterialPageRoute(builder: (_) => const ReceiptSettingView());
      case receiptDisplayScreen:
        var transId = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => ReceiptDisplayView(transactionId: transId,));
      // case invoiceDisplayScreen:
      //   var transId = settings.arguments as int;
      //   return MaterialPageRoute(builder: (_) => InvoiceDisplayView(transactionId: transId,));
      case invoiceDisplayScreen:
        var transId = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => AppInvoiceDisplay(transactionId: transId,));
      case customerDetailScreen:
        var contactId = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => NewCustomerView(customerId: contactId,));
      case editSaleLineItemScreen:
        var line = settings.arguments as SaleLine;
        return MaterialPageRoute(builder: (_) => ModifyLineItemScreen(saleLine: line,));
      case orderSummaryScreen:
        var transId = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => OrderSummaryView(orderId: transId,));
      case localeScreen:
        return MaterialPageRoute(builder: (_) => const LocaleView());
      case taxConfigurationScreen:
        return MaterialPageRoute(builder: (_) => const CreateEditTaxView());
      case employeeDetailScreen:
        EmployeeEntity? emp = settings.arguments as EmployeeEntity?;
        return MaterialPageRoute(builder: (_) => EmployeeDetailView(employee: emp,));
      case invoiceSettingViewScreen:
        return MaterialPageRoute(builder: (_) => const InvoiceSettingView());
      case employeeScreen:
        return MaterialPageRoute(builder: (_) => const EmployeeView());
      case sequenceConfigScreen:
        return MaterialPageRoute(builder: (_) => const CreateEditSequenceView());
      case bulkImportScreen:
        return MaterialPageRoute(builder: (_) => const BulkImportView());
      case createDealScreen:
        return MaterialPageRoute(builder: (_) => const CreateEditDealsView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}