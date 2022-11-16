
import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

import '../../../entity/pos/entity.dart';
import '../../../repositories/product_repository.dart';

part 'item_search_event.dart';
part 'item_search_state.dart';

class ItemSearchBloc extends Bloc<ItemSearchEvent, ItemSearchState> {

  final log = Logger('ItemSearchBloc');
  final ProductRepository productRepository;
  
  ItemSearchBloc({ required this.productRepository }) : super(ItemSearchState()) {
    on<SearchItemByFilter>(_onSearchItem);
  }

  void _onSearchItem(SearchItemByFilter event, Emitter<ItemSearchState> emit) async {
    if (event.filter.isEmpty) {
      emit(state.copyWith(products: [], filter: state.filter.copyWith(filterText: event.filter), status: ItemSearchStatus.success));
      return;
    }

    try {
      emit(state.copyWith(status: ItemSearchStatus.loading, filter: state.filter.copyWith(filterText: event.filter)));
      var prod = await productRepository.searchProductByFilter(event.filter);
      emit(state.copyWith(products: prod, status: ItemSearchStatus.success, filter: state.filter.copyWith(filterText: event.filter)));
    } catch (e) {
      log.severe(e);
      emit(state.copyWith(status: ItemSearchStatus.failure));
    }
  }
}
