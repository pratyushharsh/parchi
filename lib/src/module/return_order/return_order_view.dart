import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../entity/pos/entity.dart';
import '../../repositories/reason_code_repository.dart';
import '../../util/text_input_formatter/custom_formatter.dart';
import '../../widgets/code_value_dropdown.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import 'bloc/return_order_bloc.dart';
import 'return_form_validation.dart';

// Step To Return A Order

class ReturnOrderView extends StatelessWidget {
  final List<TransactionLineItemEntity> currentOrderLineItem;
  const ReturnOrderView({Key? key, required this.currentOrderLineItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReturnOrderBloc(
          currentOrderLineItem: currentOrderLineItem,
          transactionRepository: RepositoryProvider.of(context)),
      child: Column(
        children: [
          BlocBuilder<ReturnOrderBloc, ReturnOrderState>(
            builder: (context, state) {
              if (state.status == ReturnOrderExistStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state.status == ReturnOrderExistStatus.success) {
                if (state.availableLineItemToReturn.isEmpty) {
                  return Expanded(
                    child: Center(
                      child: Text(
                          "No Line Item To Return Order # ${state.order!.transId}"),
                    ),
                  );
                }

                return Expanded(
                  child: ReturnOrderSuccessView(
                    order: state.order!,
                    alreadyReturnedOrderMap: state.alreadyReturnedOrderMap,
                    canBeReturnedItems: state.availableLineItemToReturn,
                  ),
                );
              }

              return const SearchReturnOrderForm();
            },
          ),
        ],
      ),
    );
  }
}

class SearchReturnOrderForm extends StatelessWidget {
  const SearchReturnOrderForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          label: "Order No",
          textInputType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onFieldSubmitted: (value) {
            if (int.tryParse(value) != null) {
              BlocProvider.of<ReturnOrderBloc>(context)
                  .add(SearchOrderToReturn(orderId: int.parse(value)));
            }
          },
        ),
        BlocBuilder<ReturnOrderBloc, ReturnOrderState>(
            builder: (context, state) {
          if (state.status == ReturnOrderExistStatus.notFound) {
            return Center(
              child: Text(state.errorMessage ?? "Order Not Found"),
            );
          }

          return Container();
        })
      ],
    );
  }
}

class ReturnOrderSuccessView extends StatelessWidget {
  final TransactionHeaderEntity order;
  final Map<String, double> alreadyReturnedOrderMap;
  final List<TransactionLineItemEntity> canBeReturnedItems;
  const ReturnOrderSuccessView(
      {Key? key,
      required this.order,
      required this.alreadyReturnedOrderMap,
      required this.canBeReturnedItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                  children: canBeReturnedItems
                      .map((e) => Column(
                            children: [
                              ReturnOrderLineItem(
                                lineItem: e,
                                returnedQuantity: alreadyReturnedOrderMap[
                                        "${e.lineItemSeq}#${e.itemId}"] ??
                                    0.0,
                              ),
                              const Divider(
                                height: 0,
                              )
                            ],
                          ))
                      .toList()),
            ),
          ),
          Row(children: [
            Expanded(
              child: RejectButton(
                label: "Cancel",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: AcceptButton(
                label: "Proceed To Return",
                onPressed: () {
                  Navigator.of(context).pop(
                      BlocProvider.of<ReturnOrderBloc>(context)
                          .state
                          .returnMap);
                },
              ),
            ),
          ])
        ],
      ),
    );
  }
}

class ReturnOrderLineItem extends StatefulWidget {
  final TransactionLineItemEntity lineItem;
  final double returnedQuantity;
  const ReturnOrderLineItem(
      {Key? key, required this.lineItem, this.returnedQuantity = 0.0})
      : super(key: key);

  @override
  State<ReturnOrderLineItem> createState() => _ReturnOrderLineItemState();
}

class _ReturnOrderLineItemState extends State<ReturnOrderLineItem> {
  bool _checked = false;
  ReasonCodeEntity? _reasonCode;

  double? returnedQuantity;
  String? comment;
  bool isValid = false;

  ReturnLineItemParameters? _isValid() {
    if (returnedQuantity != null && _reasonCode != null) {
      var data = ReturnLineItemParameters(
        reasonCode: _reasonCode!.reasonCode,
        comment: comment,
        quantity: returnedQuantity!,
      );

      BlocProvider.of<ReturnOrderBloc>(context).add(
        AddLineItemToReturn(
          lineItem: widget.lineItem,
          returnLineItemParameters: data,
        ),
      );
      return data;
    }
    return null;
  }

  Widget _buildDesktop() {
    return Card(
      margin: const EdgeInsets.all(0),
      elevation: 0,
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (_checked) {
              _checked = false;
              _reasonCode = null;
              returnedQuantity = null;
              comment = null;
              BlocProvider.of<ReturnOrderBloc>(context)
                  .add(RemoveLineItemFromReturn(lineItem: widget.lineItem));
            } else {
              _checked = true;
            }
          });
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(children: [
                Checkbox(
                  value: isValid,
                  onChanged: (value) {
                    ReturnLineItemParameters? data = _isValid();
                    if (value != null && data != null) {
                      if (value) {
                      } else {
                        BlocProvider.of<ReturnOrderBloc>(context).add(
                            RemoveLineItemFromReturn(
                                lineItem: widget.lineItem));
                      }
                    }
                    setState(() {
                      isValid = _isValid() != null;
                    });
                  },
                ),
                const SizedBox(width: 50, height: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.lineItem.itemId!,
                    ),
                    Text(
                      widget.lineItem.itemDescription!,
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 80,
                          child: CustomTextField(
                              enabled: false,
                              initialValue: (widget.lineItem.quantity! -
                                      widget.returnedQuantity)
                                  .toString(),
                              label: "Qty"),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 80,
                          child: CustomTextField(
                            enabled: _checked,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            textAlign: TextAlign.end,
                            inputFormatters: [
                              CustomInputTextFormatter.positiveNumber,
                              MinMaxDecimalFormatter(
                                min: 1.0,
                                max: widget.lineItem.quantity! -
                                    widget.returnedQuantity,
                              ),
                            ],
                            label: "Return",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Required";
                              }
                              return null;
                            },
                            onValueChange: (value) {
                              setState(() {
                                returnedQuantity = double.parse(value);
                                isValid = _isValid() != null;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ]),
              if (_checked)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomDropDown<ReasonCodeEntity>(
                        value: _reasonCode,
                        label: 'Reason',
                        itemAsString: (ReasonCodeEntity? value) =>
                        value?.description ?? "",
                        asyncItems: (filter) async {
                          return await RepositoryProvider.of<ReasonCodeRepository>(context)
                                      .getReasonCodeByTypeCode("RETURN");
                        },
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _reasonCode = value;
                              isValid = _isValid() != null;
                            });
                          }
                        },
                        validator: ReturnFormValidator.validateReasonCode,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: CustomTextField(
                        label: 'Comment',
                        onValueChange: (value) {
                          setState(() {
                            comment = value;
                          });
                        },
                      ),
                    )
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobile() {
    return Card(
      margin: const EdgeInsets.all(0),
      elevation: 0,
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (_checked) {
              _checked = false;
              _reasonCode = null;
              returnedQuantity = null;
              comment = null;
              BlocProvider.of<ReturnOrderBloc>(context)
                  .add(RemoveLineItemFromReturn(lineItem: widget.lineItem));
            } else {
              _checked = true;
            }
          });
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isValid,
                    onChanged: (value) {
                      ReturnLineItemParameters? data = _isValid();
                      if (value != null && data != null) {
                        if (value) {
                        } else {
                          BlocProvider.of<ReturnOrderBloc>(context).add(
                              RemoveLineItemFromReturn(
                                  lineItem: widget.lineItem));
                        }
                      }
                      setState(() {
                        isValid = _isValid() != null;
                      });
                    },
                  ),
                  const SizedBox(width: 10, height: 50),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.lineItem.itemId!,
                        ),
                        Text(
                          widget.lineItem.itemDescription!,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (_checked)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomTextField(
                          enabled: false,
                          initialValue: (widget.lineItem.quantity! -
                                  widget.returnedQuantity)
                              .toString(),
                          label: "Qty"),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomTextField(
                        enabled: _checked,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        textAlign: TextAlign.end,
                        textInputType: TextInputType.number,
                        inputFormatters: [
                          CustomInputTextFormatter.positiveNumber,
                          MinMaxDecimalFormatter(
                            min: 1.0,
                            max: widget.lineItem.quantity! -
                                widget.returnedQuantity,
                          ),
                        ],
                        label: "Return",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Required";
                          }
                          return null;
                        },
                        onValueChange: (value) {
                          setState(() {
                            returnedQuantity = double.parse(value);
                            isValid = _isValid() != null;
                          });
                        },
                      ),
                    )
                  ],
                ),
              if (_checked)
                CustomDropDown<ReasonCodeEntity>(
                    value: _reasonCode,
                    label: 'Reason',
                    itemAsString: (ReasonCodeEntity? value) =>
                    value?.description ?? "",
                    asyncItems: (filter) async {
                      return await RepositoryProvider.of<ReasonCodeRepository>(context)
                          .getReasonCodeByTypeCode("RETURN");
                    },
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _reasonCode = value;
                          isValid = _isValid() != null;
                        });
                      }
                    },
                    validator: ReturnFormValidator.validateReasonCode,
                ),
              if (_checked)
                CustomTextField(
                  label: 'Comment',
                  onValueChange: (value) {
                    setState(() {
                      comment = value;
                    });
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (Platform.isIOS || Platform.isAndroid)
        ? _buildMobile()
        : _buildDesktop();
  }
}
