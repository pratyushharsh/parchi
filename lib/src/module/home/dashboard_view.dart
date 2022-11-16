import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme_settings.dart';
import '../../widgets/search_bar.dart';
import '../list_all_receipt/list_all_receipt_view.dart';
import '../sync/bloc/background_sync_bloc.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
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
        ),
        const Positioned(
          top: 35,
          left: 10,
          right: 10,
          child: SearchBar(label: "dashboard", hintText: "Search by Receipt Id, Phone Number",),
        ),
        const Positioned(
          top: 80,
          bottom: 0,
          left: 10,
          right: 10,
          child: ListAllReceiptView(),
        ),
      ],
    );
  }
}
