import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme_settings.dart';
import '../../model/model.dart';
import '../../repositories/mock/mock_transaction_repository.dart';
import '../../widgets/my_loader.dart';
import '../receipt_display/bloc/receipt_display_bloc.dart';
import '../receipt_display/receipt_display_view.dart';
import 'bloc/receipt_setting_bloc.dart';

class MockReceiptView extends StatefulWidget {
  const MockReceiptView({Key? key}) : super(key: key);

  @override
  State<MockReceiptView> createState() => _MockReceiptViewState();
}

class _MockReceiptViewState extends State<MockReceiptView> {
  final GlobalKey<State<StatefulWidget>> _printKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => ReceiptDisplayBloc(
          transId: '10001',
          authBloc: RepositoryProvider.of(context),
          transactionRepo: MockTransactionRepository(
              restClient: RepositoryProvider.of(context)),
          settingsRepo: RepositoryProvider.of(context))
        ..add(FetchReceiptDataEvent()),
      child: BlocListener<ReceiptSettingBloc, ReceiptSettingState>(
        listener: (context, state) {
          ReceiptSettingsModel model = ReceiptSettingsModel(
            storeNumber: state.storeNumber,
            storeAddress: state.storeAddress,
            tagLine: state.tagLine,
            footerTitle: state.footerTitle,
            footerSubtitle: state.footerSubtitle,
          );

          BlocProvider.of<ReceiptDisplayBloc>(context).add(
            MockUpdateReceiptSettingData(model),
          );
        },
        child: MockReceiptForm(
          printKey: _printKey,
        ),
      ),
    );
  }
}

class MockReceiptForm extends StatelessWidget {
  final GlobalKey<State<StatefulWidget>> printKey;

  const MockReceiptForm({Key? key, required this.printKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReceiptDisplayBloc, ReceiptDisplayState>(
      builder: (context, state) {
        if (state.status == ReceiptDisplayStatus.loading) {
          return const MyLoader(color: AppColor.primary);
        }

        if (state.status == ReceiptDisplayStatus.success) {
          return InteractiveViewer(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ReceiptBlock(
                    printKey: printKey,
                  ),
                ],
              ),
            ),
          );
        }

        return Container();
      },
    );
  }
}
