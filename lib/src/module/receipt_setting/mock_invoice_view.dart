import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:printing/printing.dart';

import '../../config/theme_settings.dart';
import '../../repositories/mock/mock_transaction_repository.dart';
import '../../widgets/my_loader.dart';
import '../authentication/bloc/authentication_bloc.dart';
import '../receipt_display/bloc/receipt_display_bloc.dart';
import '../receipt_display/template/invoice.dart';
import '../receipt_display/template/invoice_config.dart';
import 'bloc/invoice_setting_bloc.dart';

class MockInvoiceView extends StatefulWidget {
  const MockInvoiceView({Key? key}) : super(key: key);

  @override
  State<MockInvoiceView> createState() => _MockInvoiceViewState();
}

class _MockInvoiceViewState extends State<MockInvoiceView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => ReceiptDisplayBloc(
          transId: 10,
          authBloc: RepositoryProvider.of(context),
          transactionRepo: MockTransactionRepository(
              restClient: RepositoryProvider.of(context)),
          settingsRepo: RepositoryProvider.of(context))
        ..add(FetchReceiptDataEvent()),
      child: BlocBuilder<InvoiceSettingBloc, InvoiceSettingState>(
        builder: (context, state) {
          return MockInvoiceForm(
              config: InvoiceConfig(
            columnConfig: state.columns,
            showTaxSummary: state.showTaxSummary,
            showPaymentDetails: state.showPaymentDetails,
            headerFieldConfig: state.headerFields,
            billingAddFieldConfig: state.billingAddressFields,
            shippingAddFieldConfig: state.shippingAddressFields,
            paymentColumnConfig: state.paymentColumns,
            logo: state.logo,
            termsAndCondition: state.termsAndCondition,
            declaration: state.declaration,
            showDeclaration: state.showDeclaration,
            showTermsAndCondition: state.showTermsAndCondition,
          ));
        },
      ),
    );
  }
}

class MockInvoiceForm extends StatelessWidget {
  final InvoiceConfig config;
  const MockInvoiceForm({Key? key, required this.config}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReceiptDisplayBloc, ReceiptDisplayState>(
      builder: (context, state) {
        if (state.status == ReceiptDisplayStatus.loading) {
          return const MyLoader(color: AppColor.primary);
        }

        if (state.status == ReceiptDisplayStatus.success) {
          return Container(
            color: Colors.white,
            padding: const EdgeInsets.only(top: 70),
            child: PdfPreview(
              shouldRepaint: true,
              loadingWidget: const MyLoader(color: AppColor.primary),
              useActions: false,
              allowPrinting: false,
              allowSharing: false,
              canDebug: false,
              maxPageWidth: 700,
              scrollViewDecoration: const BoxDecoration(
                color: Colors.white,
              ),
              build: (format) => generateInvoice(
                format,
                state.header!,
                RepositoryProvider.of<AuthenticationBloc>(context).state.store!,
                config,
              ),
            ),
          );
        }

        return Container();
      },
    );
  }
}
