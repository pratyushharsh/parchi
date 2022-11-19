import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/color_config.dart';
import 'bloc/list_all_item_bloc.dart';

class ItemFilterBar extends StatelessWidget {
  const ItemFilterBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: ListView(
        scrollDirection: Axis.horizontal,
        primary: true,
        children: [
          const BrandFilterBar(),
          BlocBuilder<ListAllItemBloc, ListAllItemState>(
            builder: (context, state) {
              if (state.filterCriteria.brands.isEmpty) {
                return const SizedBox.shrink();
              }

              return ListView(
                scrollDirection: Axis.horizontal,
                primary: false,
                shrinkWrap: true,
                children: state.filterCriteria.brands
                    .map((e) => FilterBrandChip(
                          brand: e,
                        ))
                    .toList(),
              );
            },
          ),
          const CategoryFilterBar(),
          BlocBuilder<ListAllItemBloc, ListAllItemState>(
            builder: (context, state) {
              if (state.filterCriteria.categories.isEmpty) {
                return const SizedBox.shrink();
              }

              return ListView(
                scrollDirection: Axis.horizontal,
                primary: false,
                shrinkWrap: true,
                children: state.filterCriteria.categories
                    .map((e) => FilterCategoryChip(
                  category: e,
                ))
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class BrandFilterBar extends StatelessWidget {
  const BrandFilterBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListAllItemBloc, ListAllItemState>(
      builder: (context, state) {
        return PopupMenuButton<String>(
          tooltip: "Filter by brand",
          position: PopupMenuPosition.under,
          offset: const Offset(0, 20),
          itemBuilder: (context) {
            return state.brands.map((e) {
              return PopupMenuItem<String>(
                value: e,
                child: Text(e),
              );
            }).toList();
          },
          onSelected: (value) {
            context.read<ListAllItemBloc>().add(AddProductByBrandFilter(value));
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 4.0),
            child: Chip(
              avatar: Icon(Icons.badge_outlined, size: 16,),
              label: Text("Brand"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        );
      },
    );
  }
}

class FilterBrandChip extends StatelessWidget {
  final String brand;
  const FilterBrandChip({Key? key, required this.brand}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = ColorConstants.getCategoryColor(brand);
    return Container(
      height: 10,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: color,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            brand,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          InkWell(
            onTap: () {
              context
                  .read<ListAllItemBloc>()
                  .add(RemoveProductByBrandFilter(brand));
            },
            child: const Icon(
              Icons.close,
              size: 14,
            ),
          )
        ],
      ),
    );
  }
}

class FilterCategoryChip extends StatelessWidget {
  final String category;
  const FilterCategoryChip({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = ColorConstants.getCategoryColor(category);
    return Container(
      height: 10,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: color,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            category,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          InkWell(
            onTap: () {
              context
                  .read<ListAllItemBloc>()
                  .add(RemoveCategoryFilter(category));
            },
            child: const Icon(
              Icons.close,
              size: 14,
            ),
          )
        ],
      ),
    );
  }
}

class CategoryFilterBar extends StatelessWidget {
  const CategoryFilterBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListAllItemBloc, ListAllItemState>(
      builder: (context, state) {
        return BlocBuilder<ListAllItemBloc, ListAllItemState>(
          builder: (context, state) {
            return PopupMenuButton<String>(
              tooltip: "Filter by category",
              position: PopupMenuPosition.under,
              offset: const Offset(0, 20),
              itemBuilder: (context) {
                return state.categories.map((e) {
                  return PopupMenuItem<String>(
                    value: e,
                    child: Text(e),
                  );
                }).toList();
              },
              onSelected: (value) {
                context.read<ListAllItemBloc>().add(AddCategoryFilter(value));
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Chip(
                  avatar: Icon(
                    Icons.category,
                    size: 16,
                  ),
                  label: Text("Category"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
