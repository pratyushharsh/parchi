import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme_settings.dart';
import '../../widgets/search_bar.dart';
import '../list_all_receipt/bloc/list_all_receipt_bloc.dart';
import '../list_all_receipt/list_all_receipt_view.dart';
import '../list_all_receipt/transaction_filter_bar.dart';
import '../sync/bloc/background_sync_bloc.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ListAllReceiptBloc(transactionRepository: context.read())
            ..add(LoadAllReceipt()),
      child: Column(
        children: [
          Container(
            color: AppColor.primary,
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Dashboard", style: TextStyle(color: Colors.white)),
                BlocBuilder<BackgroundSyncBloc, BackgroundSyncState>(
                  builder: (context, state) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FittedBox(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 4,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0, left: 8, right: 8),
            child: SearchBar(
                label: "dashboard",
                hintText: "Search by Receipt Id, Phone Number",
                filterWidget: TransactionFilterBar()),
          ),
          const Expanded(
            child: ListAllReceiptView(),
          )
        ],
      ),
    );
  }
}
