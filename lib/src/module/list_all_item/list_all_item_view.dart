import 'dart:math';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/color_config.dart';
import '../../config/route_config.dart';
import '../../config/theme_settings.dart';
import '../../entity/pos/entity.dart';
import '../../widgets/cloud_sync_widget.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/extension/retail_extension.dart';
import '../../widgets/my_loader.dart';
import '../create_new_item/add_new_item_view.dart';
import 'bloc/list_all_item_bloc.dart';

class WidgetNoItems extends StatelessWidget {
  const WidgetNoItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.dashboard_customize_outlined,
                size: 100, color: AppColor.iconColor),
            Text("Add your items to proceed with sale.",
                style: TextStyle(
                    color: AppColor.iconColor, fontStyle: FontStyle.italic)),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class AllProductsList extends StatelessWidget {
  const AllProductsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<ListAllItemBloc, ListAllItemState>(
          builder: (context, state) {
            if (state.status == ListAllItemStatus.loading) {
              return const CircularProgressIndicator();
            }
            return RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<ListAllItemBloc>(context).add(RefreshProduct());
              },
              child: state.products.isEmpty
                  ? const WidgetNoItems()
                  : ListView.builder(
                      itemCount: state.products.length + 1,
                      itemBuilder: (ctx, idx) {
                        if (idx == state.products.length) {
                          if (!state.end &&
                              state.status !=
                                  ListAllItemStatus.loadingNextProducts) {
                            BlocProvider.of<ListAllItemBloc>(context)
                                .add(LoadNextProduct());
                          }
                          return SizedBox(
                            height: 200,
                            child: ListAllItemStatus.loadingNextProducts ==
                                    state.status
                                ? const MyLoader(
                                    color: AppColor.color6,
                                  )
                                : Container(),
                          );
                        }
                        return ItemCard(product: state.products[idx]);
                      }),
            );
          },
        ),
        Positioned(
          bottom: 90,
          right: 10,
          child: OpenContainer(
            transitionType: ContainerTransitionType.fade,
            transitionDuration: const Duration(milliseconds: 300),
            openBuilder: (BuildContext context, VoidCallback _) {
              return const AddNewItemScreen();
            },
            closedElevation: 6.0,
            closedShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            closedBuilder: (BuildContext context, void Function() action) {
              return Container(
                height: 40,
                width: 40,
                color: AppColor.primary,
                child: const Center(
                  child: Icon(
                    Icons.add,
                    color: AppColor.iconColor,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ItemCard extends StatelessWidget {
  final ItemEntity product;
  const ItemCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Card(
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(RouteConfig.editItemScreen,
                arguments: product.productId);
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: product.imageUrl.isNotEmpty
                        ? CustomImage(
                            url: product.imageUrl[0],
                            imageDim: 200,
                          )
                        : const SizedBox(
                            height: 200,
                            child: Center(
                              child: Icon(
                                Icons.image,
                                color: AppColor.iconColor,
                                size: 50,
                              ),
                            ),
                          ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.displayName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                            Text(
                              '${product.productId ?? product.skuCode}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            if (product.brand != null &&
                                product.brand!.isNotEmpty)
                              ProductCategoryChip(
                                category: product.brand!,
                                fontWeight: FontWeight.w600,
                              ),
                            ...product.category
                                .map((e) => ProductCategoryChip(category: e))
                                .toList(),
                          ],
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        if (product.salePrice != null && product.salePrice! > 0)
                          Text(
                              getCurrencyFormatter(context)
                                  .format(product.salePrice!),
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600)),
                        if (product.listPrice != null)
                          Text(
                            getCurrencyFormatter(context)
                                .format(product.listPrice!),
                            style: (product.salePrice != null &&
                                    product.salePrice! > 0)
                                ? const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontStyle: FontStyle.italic,
                                    color: AppColor.color5)
                                : const TextStyle(),
                          ),
                      ]),
                      CloudSyncIcon(
                        syncState: product.syncState ?? 0,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductCategoryChip extends StatelessWidget {
  final String category;
  final FontWeight fontWeight;
  const ProductCategoryChip(
      {Key? key, required this.category, this.fontWeight = FontWeight.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = ColorConstants.getCategoryColor(category);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color),
      ),
      child: Text(
        category,
        style: TextStyle(fontWeight: fontWeight, color: color),
      ),
    );
  }
}
