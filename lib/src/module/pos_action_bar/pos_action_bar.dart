import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../create_new_receipt/bloc/create_new_receipt_bloc.dart';
import '../return_order/return_order_view.dart';

class PosActionBar extends StatelessWidget {
  const PosActionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            PosActionButton(
              text: "Return",
              onTap: () {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return Dialog(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.8,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: ReturnOrderView(currentOrderLineItem: BlocProvider.of<CreateNewReceiptBloc>(context).state.lineItem),
                        ),
                      );
                    }).then((value) => {
                      if (value != null) {
                        BlocProvider.of<CreateNewReceiptBloc>(context)
                            .add(OnReturnLineItemEvent(value))
                      }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PosActionButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  const PosActionButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 80,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 80,
          width: 80,
          child: Center(child: Text(text)),
        ),
      ),
    );
  }
}
