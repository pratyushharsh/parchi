import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme_settings.dart';
import '../../entity/pos/entity.dart';
import '../../widgets/custom_text_field.dart';
import 'bloc/item_search_bloc.dart';

class SearchItemView extends StatelessWidget {
  const SearchItemView({Key? key}) : super(key: key);

  Widget buildItemCard(BuildContext context, ProductEntity product) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop(product);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                  child: Text(
                    "${product.skuCode ?? product.productId} | ${product.displayName}",
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          const Divider(height: 0,),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: true,
      create: (ctx) =>
          ItemSearchBloc(productRepository: RepositoryProvider.of(ctx)),
      child: SizedBox(
        height: min(800, MediaQuery.of(context).size.height * 0.6),
        child: Card(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SearchSaleProductBar(),
                Expanded(
                  child: BlocBuilder<ItemSearchBloc, ItemSearchState>(
                      builder: (context, state) {

                    if (state.status == ItemSearchStatus.initial) {
                      return const Center(
                        child: Icon(Icons.search_rounded, size: 120, color: AppColor.color3),
                      );
                    }

                    if ( state.products.isEmpty) {
                      return const Center(
                        child: Text("No products found"),
                      );
                    }

                    return SingleChildScrollView(
                      child: Column(
                        children: state.products
                            .map((e) => buildItemCard(context, e))
                            .toList(),
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchSaleProductBar extends StatelessWidget {
  const SearchSaleProductBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: "_searchForProducts",
      hint: "_searchForProductsHint",
      onValueChange: (val) {
        if (val.isNotEmpty) {
          BlocProvider.of<ItemSearchBloc>(context).add(SearchItemByFilter(val));
        }
      },
    );
  }
}
