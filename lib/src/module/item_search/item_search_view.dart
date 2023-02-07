import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    );
  }
}

class SearchSaleProductBar extends StatelessWidget {
  const SearchSaleProductBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: "_searchForProducts",
      onValueChange: (val) {
        if (val.isNotEmpty) {
          BlocProvider.of<ItemSearchBloc>(context).add(SearchItemByFilter(val));
        }
      },
    );
  }
}
