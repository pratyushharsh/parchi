import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme_settings.dart';
import '../../entity/pos/table_entity.dart';
import '../../repositories/table_repository.dart';
import '../../widgets/desktop_pop_up.dart';
import '../table_layout/layout_designer.dart';
import 'new_table_form.dart';

class NewTableButtonMobile extends StatelessWidget {
  const NewTableButtonMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showTransitiveAppPopUp(
          context: context,
          child: const NewTableForm(),
          title: '_createNewTaxGroup',
        ).then((value) => {});
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: AppColor.color8,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Column(
            children: [
              const Icon(Icons.add),
              const Text("_addNewTable").tr(),
            ],
          ),
        ),
      ),
    );
  }
}

class TableConfigMobileView extends StatelessWidget {
  const TableConfigMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // BlocProvider.of<TableBloc>(context).add(TableEvent.fetch());
      },
      child: Container(),
    );
  }
}
