import 'package:bloc/bloc.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

import '../../../database/db_provider.dart';
import '../../../entity/pos/entity.dart';

part 'list_all_item_event.dart';
part 'list_all_item_state.dart';

class ListAllItemBloc extends Bloc<ListAllItemEvent, ListAllItemState> with DatabaseProvider {
  final log = Logger('ListAllItemBloc');

  ListAllItemBloc() : super(ListAllItemState()) {
    on<LoadAllItems>(_onLoadItem);
    on<LoadNextProduct>(_onLoadNextProducts);
    on<SearchProductByNameFilter>(_filerProductsByDisplayName);
  }

  void _onLoadItem(LoadAllItems event, Emitter<ListAllItemState> emit) async {
    try {
      emit(state.copyWith(status: ListAllItemStatus.loading));
      var prod = <ProductEntity>[];
      if (state.filterCriteria.filter != null && state.filterCriteria.filter!.isNotEmpty) {
        prod = await db.productEntitys
            .where()
            .productIdEqualTo(state.filterCriteria.filter)
            .or()
            .descriptionWordsElementStartsWith(state.filterCriteria.filter!)
            .limit(state.filterCriteria.limit).findAll();
      } else {
        prod = await db.productEntitys.where().limit(state.filterCriteria.limit).findAll();
      }
      emit(
          state.copyWith(products: prod, status: ListAllItemStatus.success));
    } catch (e) {
      log.severe(e);
      emit(state.copyWith(status: ListAllItemStatus.failure));
    }
  }

  void _onLoadNextProducts(LoadNextProduct event, Emitter<ListAllItemState> emit) async {
    emit(state.copyWith(status: ListAllItemStatus.loadingNextProducts));
    try {
      var prod = <ProductEntity>[];
      if (state.filterCriteria.filter != null && state.filterCriteria.filter!.isNotEmpty) {
        prod = await db.productEntitys
            .where()
            .productIdEqualTo(state.filterCriteria.filter)
            .or()
            .descriptionWordsElementStartsWith(state.filterCriteria.filter!)
            .offset(state.products.length)
            .limit(state.filterCriteria.limit)
            .findAll();
      } else {
        prod = await db.productEntitys.where().offset(state.products.length).limit(state.filterCriteria.limit).findAll();
      }
      List<ProductEntity> newProducts = [...state.products, ...prod];
      emit(state.copyWith(status: ListAllItemStatus.success, products: newProducts, end: prod.isEmpty));
    } catch (e) {
      log.severe(e);
      emit(state.copyWith(status: ListAllItemStatus.failure,));
    }
  }

  void _filerProductsByDisplayName(SearchProductByNameFilter event, Emitter<ListAllItemState> emit) async {
    var fc = state.filterCriteria;
    emit(state.copyWith(filterCriteria: fc.copyWith(filter: event.filterString)));
    add(LoadAllItems());
  }
}
