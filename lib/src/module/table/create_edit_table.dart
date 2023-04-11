import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme_settings.dart';
import '../../widgets/appbar_leading.dart';
import 'bloc/create_edit_table_bloc.dart';
import 'create_table_desktop_view.dart';
import 'create_table_mobile_view.dart';

class CreateEditTableView extends StatelessWidget {
  const CreateEditTableView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CreateEditTableBloc(tableRepository: RepositoryProvider.of(context))..add(FetchAllFloors()),
      child: Container(
        color: AppColor.primary,
        child: SafeArea(
          bottom: false,
          child: Scaffold(
              backgroundColor: AppColor.background,
              body: Stack(
                fit: StackFit.expand,
                children: [
                  const Positioned(
                    top: 75,
                    left: 16,
                    right: 16,
                    bottom: 16,
                    child: TableConfigView(),
                  ),
                  Positioned(
                    top: 20,
                    left: 16,
                    child: AppBarLeading(
                      heading: "_tableManagement",
                      icon: Icons.arrow_back,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class TableConfigView extends StatelessWidget {
  const TableConfigView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (Platform.isIOS || Platform.isAndroid) {
        return const TableConfigMobileView();
      } else {
        return const TableConfigDesktopView();
      }
    });
  }
}
