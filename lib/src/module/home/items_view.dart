import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme_settings.dart';
import '../../widgets/search_bar.dart';
import '../list_all_item/bloc/list_all_item_bloc.dart';
import '../list_all_item/item_filter_bar.dart';
import '../list_all_item/list_all_item_view.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => ListAllItemBloc(productRepository: context.read())
        ..add(InitProductSearch()),
      child: const ItemViewWidgets(),
    );
  }
}

class ItemViewWidgets extends StatelessWidget {
  const ItemViewWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColor.primary,
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Row(
            children: [
              const Text("_productTitle", style: TextStyle(color: Colors.white)).tr(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
          child: SearchBar(
            label: "items",
            onChanged: (value) {
              BlocProvider.of<ListAllItemBloc>(context)
                  .add(SearchProductByNameFilter(value));
            },
            hintText: "_searchProductHint".tr(),
            filterWidget: const ItemFilterBar(),
          ),
        ),
        const Expanded(
          child: AllProductsList(),
        ),
      ],
    );
  }
}
