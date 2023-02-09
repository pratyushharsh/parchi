import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/theme_settings.dart';
import '../module/authentication/bloc/authentication_bloc.dart';
import '../module/sync/bloc/background_sync_bloc.dart';

class StoreUserWidget extends StatelessWidget {
  const StoreUserWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BackgroundSyncBloc, BackgroundSyncState>(
  builder: (context, conn) {
    return Container(
      color: conn.isOnline ? AppColor.primary : Colors.redAccent,
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  "${state.store!.rtlLocId} | 1 | ${state.store!.storeName}", style: const TextStyle(color: Colors.white)),
              Text(conn.isOnline ? "" : "Offline", style: const TextStyle(color: Colors.white)),
              Text(
                  "${state.employee?.firstName ?? ""} ${state.employee?.middleName ?? ""} ${state.employee?.lastName ?? ""}", style: const TextStyle(color: Colors.white)),
            ],
          );
        },
      ),
    );
  },
);
  }
}
