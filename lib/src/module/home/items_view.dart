import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme_settings.dart';
import '../../widgets/search_bar.dart';
import '../list_all_item/bloc/list_all_item_bloc.dart';
import '../list_all_item/list_all_item_view.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => ListAllItemBloc()
        ..add(LoadAllItems()),
      child: const  ItemViewWidgets(),
    );
  }
}

class ItemViewWidgets extends StatelessWidget {
  const ItemViewWidgets({Key? key}) : super(key: key);

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
              children: const [
                Text("Products", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
        Positioned(
          top: 35,
          left: 10,
          right: 10,
          child: SearchBar(label: "items", onChanged: (value) {
            BlocProvider.of<ListAllItemBloc>(context).add(SearchProductByNameFilter(value));
          },
            hintText: "Search by Product Id, Name",
          ),
        ),
        const Positioned(
          top: 80,
          bottom: 0,
          left: 10,
          right: 10,
          child: AllProductsList(),
        ),
      ],
    );
  }
}
