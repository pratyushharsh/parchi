import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme_settings.dart';
import '../../entity/pos/entity.dart';
import '../../util/text_input_formatter/widget.dart';
import '../../widgets/custom_dialog.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/extension/retail_extension.dart';
import '../create_new_receipt/bloc/create_new_receipt_bloc.dart';
import '../create_new_receipt/sale_complete_dialog.dart';
import 'bloc/line_item_modification_bloc.dart';
import 'line_item_tax_modification.dart';

enum LineItemModificationType { price, quantity, discount, tax }

enum TaxCalculationMethod { percentage, amount }

enum DiscountCalculationMethod { percentage, amount }

class LineItemModificationView extends StatefulWidget {
  final TransactionLineItemEntity lineItem;
  final ItemEntity? productModel;
  const LineItemModificationView(
      {Key? key, required this.lineItem, this.productModel})
      : super(key: key);

  @override
  State<LineItemModificationView> createState() =>
      _LineItemModificationViewState();
}

class _LineItemModificationViewState extends State<LineItemModificationView> {
  LineItemModificationType selectedType = LineItemModificationType.price;

  Widget _getCorrespondingData() {
    switch (selectedType) {
      case LineItemModificationType.price:
        return const LineItemPriceModifyView();
      case LineItemModificationType.quantity:
        return const LineItemQuantityModifyView();
      case LineItemModificationType.discount:
        return const LineItemDiscountModifyView();
      case LineItemModificationType.tax:
        return const LineItemTaxModifyView();
      default:
        return const Center(child: Text("Select An Operation"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LineItemModificationBloc(lineItem: widget.lineItem),
      child: Column(
        children: [
          ModifyLineItemViewCard(
            lineItem: widget.lineItem,
            productModel: widget.productModel,
          ),
          Wrap(
            children: [
              DialogButton(
                label: "Price",
                onClick: () {
                  setState(() {
                    selectedType = LineItemModificationType.price;
                  });
                },
                selected: selectedType == LineItemModificationType.price,
              ),
              DialogButton(
                label: "Quantity",
                onClick: () {
                  setState(() {
                    selectedType = LineItemModificationType.quantity;
                  });
                },
                selected: selectedType == LineItemModificationType.quantity,
              ),
              DialogButton(
                label: "Discount",
                onClick: () {
                  setState(() {
                    selectedType = LineItemModificationType.discount;
                  });
                },
                selected: selectedType == LineItemModificationType.discount,
              ),
              DialogButton(
                label: "Tax",
                onClick: () {
                  setState(() {
                    selectedType = LineItemModificationType.tax;
                  });
                },
                selected: selectedType == LineItemModificationType.tax,
              ),
              DialogButton(
                label: "Void",
                onClick: () {
                  yesOrCancelDialog(
                    context,
                    "Void Item",
                    content: "Are you sure you want to void this item?",
                  ).then((value) {
                    if (value != null && value) {
                      Navigator.of(context)
                          .pop(OnLineItemVoid(saleLine: widget.lineItem));
                    }
                  });
                },
                selected: false,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(child: _getCorrespondingData())
        ],
      ),
    );
  }
}

class ModifyLineItemViewCard extends StatelessWidget {
  final TransactionLineItemEntity lineItem;
  final ItemEntity? productModel;
  const ModifyLineItemViewCard(
      {Key? key, required this.lineItem, this.productModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      (productModel != null && productModel!.imageUrl.isNotEmpty)
          ? CustomImage(
              url: productModel!.imageUrl[0],
              height: 100,
              width: 100,
            )
          : Image.network(
              "https://cdn.iconscout.com/icon/premium/png-128-thumb/no-image-2840056-2359564.png",
              fit: BoxFit.cover,
              height: 100,
              width: 100,
              errorBuilder: (context, obj, trace) {
                return const SizedBox(
                  height: 100,
                  width: 100,
                );
              },
            ),
      Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            productModel?.displayName ?? "",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "SKU Code: ${productModel?.skuCode ?? ""}",
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),
          ),
          Text(
            "Sale Price: ${getCurrencyFormatter(context).format(lineItem.unitPrice)}",
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),
          )
        ]),
      )
    ]);
  }
}

class LineItemPriceModifyView extends StatefulWidget {
  const LineItemPriceModifyView({Key? key}) : super(key: key);

  @override
  State<LineItemPriceModifyView> createState() =>
      _LineItemPriceModifyViewState();
}

class _LineItemPriceModifyViewState extends State<LineItemPriceModifyView> {
  late TextEditingController _controller;
  double unitPrice = 0;

  @override
  initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextField(
          label: "Enter New Price",
          textInputType: TextInputType.number,
          controller: _controller,
          onValueChange: (val) {
            setState(() {
              unitPrice = double.tryParse(val) ?? 0;
            });
          },
          inputFormatters: [CustomInputTextFormatter.positiveNumber],
        ),
        Row(
          children: [
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
                label: "Change Price",
                onPressed: unitPrice >= 0
                    ? () {
                        Navigator.pop(
                          context,
                          OnUnitPriceUpdate(
                              saleLine:
                                  BlocProvider.of<LineItemModificationBloc>(
                                          context)
                                      .lineItem,
                              unitPrice: unitPrice,
                              reason: "Quantity Changed"),
                        );
                      }
                    : null,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class LineItemQuantityModifyView extends StatefulWidget {
  const LineItemQuantityModifyView({Key? key}) : super(key: key);

  @override
  State<LineItemQuantityModifyView> createState() =>
      _LineItemQuantityModifyViewState();
}

class _LineItemQuantityModifyViewState
    extends State<LineItemQuantityModifyView> {
  late TextEditingController _controller;
  double quantity = 0;

  @override
  initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextField(
          label: "Enter Quantity",
          controller: _controller,
          textInputType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onValueChange: (val) {
            setState(() {
              quantity = double.tryParse(val) ?? 0;
            });
          },
        ),
        Row(
          children: [
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
                label: "Change Quantity",
                onPressed: quantity > 0
                    ? () {
                        Navigator.pop(
                          context,
                          OnQuantityUpdate(
                              saleLine:
                                  BlocProvider.of<LineItemModificationBloc>(
                                          context)
                                      .lineItem,
                              quantity: double.parse(_controller.text),
                              reason: "Quantity Changed"),
                        );
                      }
                    : null,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class LineItemDiscountModifyView extends StatefulWidget {
  const LineItemDiscountModifyView({Key? key}) : super(key: key);

  @override
  State<LineItemDiscountModifyView> createState() =>
      _LineItemDiscountModifyViewState();
}

class _LineItemDiscountModifyViewState
    extends State<LineItemDiscountModifyView> {
  late TextEditingController _discountAmountController;
  late TextEditingController _discountPercentageController;
  double discountAmount = 0;
  double discountPercentage = 0;
  DiscountCalculationMethod method = DiscountCalculationMethod.amount;
  @override
  initState() {
    super.initState();
    _discountAmountController = TextEditingController();
    _discountPercentageController = TextEditingController();
  }

  @override
  dispose() {
    _discountAmountController.dispose();
    _discountPercentageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Expanded(
            child: ListTile(
              title: const Text('Amount Off'),
              leading: Radio<DiscountCalculationMethod>(
                fillColor: MaterialStateColor.resolveWith(
                    (states) => AppColor.primary),
                focusColor: MaterialStateColor.resolveWith(
                    (states) => AppColor.primary),
                value: DiscountCalculationMethod.amount,
                groupValue: method,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      method = value;
                    });
                  }
                },
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              title: const Text('Percentage Off'),
              leading: Radio<DiscountCalculationMethod>(
                fillColor: MaterialStateColor.resolveWith(
                    (states) => AppColor.primary),
                focusColor: MaterialStateColor.resolveWith(
                    (states) => AppColor.primary),
                value: DiscountCalculationMethod.percentage,
                groupValue: method,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      method = value;
                    });
                  }
                },
              ),
            ),
          ),
        ]),
        if (method == DiscountCalculationMethod.amount)
          CustomTextField(
            label: "Enter Discount Amount",
            controller: _discountAmountController,
            textInputType: TextInputType.number,
            inputFormatters: [CustomInputTextFormatter.positiveNumber],
            onValueChange: (val) {
              setState(() {
                discountAmount = double.tryParse(val) ?? 0;
              });
            },
          ),
        if (method == DiscountCalculationMethod.percentage)
          CustomTextField(
            label: "Enter Discount Percentage",
            controller: _discountPercentageController,
            textInputType: TextInputType.number,
            inputFormatters: [CustomInputTextFormatter.positiveNumber],
            onValueChange: (val) {
              setState(() {
                discountPercentage = double.tryParse(val) ?? 0;
              });
            },
          ),
        const Spacer(),
        Row(
          children: [
            Expanded(
              child: RejectButton(
                label: "Cancel",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(width: 10),
            if (method == DiscountCalculationMethod.amount)
              Expanded(
                child: AcceptButton(
                  label: "Apply Discount",
                  onPressed: discountAmount >= 0
                      ? () {
                          Navigator.pop(
                            context,
                            OnApplyLineItemDiscountAmount(
                                saleLine:
                                    BlocProvider.of<LineItemModificationBloc>(
                                            context)
                                        .lineItem,
                                discountAmount: discountAmount,
                                reason: "Discount Amount Changed"),
                          );
                        }
                      : null,
                ),
              ),
            if (method == DiscountCalculationMethod.percentage)
              Expanded(
                child: AcceptButton(
                  label: "Apply Discount Percentage",
                  onPressed:
                      discountPercentage >= 0 && discountPercentage <= 100
                          ? () {
                              Navigator.pop(
                                context,
                                OnApplyLineItemDiscountPercent(
                                  saleLine:
                                      BlocProvider.of<LineItemModificationBloc>(
                                              context)
                                          .lineItem,
                                  discountPercent: discountPercentage,
                                  reason: "Discount Percentage Changed",
                                ),
                              );
                            }
                          : null,
                ),
              ),
          ],
        )
      ],
    );
  }
}
