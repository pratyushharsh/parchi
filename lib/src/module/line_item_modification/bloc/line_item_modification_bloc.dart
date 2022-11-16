import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../entity/pos/entity.dart';

part 'line_item_modification_event.dart';
part 'line_item_modification_state.dart';

class LineItemModificationBloc extends Bloc<LineItemModificationEvent, LineItemModificationState> {

  final TransactionLineItemEntity lineItem;

  LineItemModificationBloc({ required this.lineItem }) : super(LineItemModificationInitial()) {
    on<LineItemModificationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
