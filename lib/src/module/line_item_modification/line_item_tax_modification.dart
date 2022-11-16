import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme_settings.dart';
import '../../util/text_input_formatter/custom_formatter.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../create_new_receipt/bloc/create_new_receipt_bloc.dart';
import 'bloc/line_item_modification_bloc.dart';
import 'line_item_modification_view.dart';

class LineItemTaxModifyView extends StatefulWidget {
  const LineItemTaxModifyView({Key? key}) : super(key: key);

  @override
  State<LineItemTaxModifyView> createState() => _LineItemTaxModifyViewState();
}

class _LineItemTaxModifyViewState extends State<LineItemTaxModifyView> {
  late TextEditingController _taxAmountController;
  late TextEditingController _taxPercentController;
  double taxAmount = 0;
  double taxPercent = 0;
  TaxCalculationMethod method = TaxCalculationMethod.amount;

  @override
  initState() {
    super.initState();
    _taxAmountController = TextEditingController();
    _taxPercentController = TextEditingController();
  }

  @override
  dispose() {
    _taxAmountController.dispose();
    _taxPercentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Expanded(
            child: ListTile(
              title: const Text('Amount'),
              leading: Radio<TaxCalculationMethod>(
                fillColor: MaterialStateColor.resolveWith(
                        (states) => AppColor.primary),
                focusColor: MaterialStateColor.resolveWith(
                        (states) => AppColor.primary),
                value: TaxCalculationMethod.amount,
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
              title: const Text('Percentage'),
              leading: Radio<TaxCalculationMethod>(
                fillColor: MaterialStateColor.resolveWith(
                        (states) => AppColor.primary),
                focusColor: MaterialStateColor.resolveWith(
                        (states) => AppColor.primary),
                value: TaxCalculationMethod.percentage,
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
        if (method == TaxCalculationMethod.amount)
          CustomTextField(
            label: "Enter Tax Amount",
            textInputType: TextInputType.number,
            controller: _taxAmountController,
            onValueChange: (val) {
              setState(() {
                taxAmount = double.tryParse(val) ?? 0;
              });
            },
            inputFormatters: [CustomInputTextFormatter.positiveNumber],
          ),
        if (method == TaxCalculationMethod.percentage)
          CustomTextField(
            label: "Enter Tax Percent",
            textInputType: TextInputType.number,
            controller: _taxPercentController,
            onValueChange: (val) {
              setState(() {
                taxPercent = double.tryParse(val) ?? 0;
              });
            },
            inputFormatters: [CustomInputTextFormatter.positiveNumber],
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
            if (method == TaxCalculationMethod.amount)
            Expanded(
              child: AcceptButton(
                label: "Change Tax Amount",
                onPressed: taxAmount >= 0
                    ? () {
                  Navigator.pop(
                    context,
                    OnChangeLineItemTaxAmount(
                        saleLine:
                        BlocProvider.of<LineItemModificationBloc>(
                            context)
                            .lineItem,
                        taxAmount: taxAmount,
                        reason: "Tax Changed"),
                  );
                }
                    : null,
              ),
            ),
            if (method == TaxCalculationMethod.percentage)
              Expanded(
                child: AcceptButton(
                  label: "Change Tax Percent",
                  onPressed: taxPercent >= 0
                      ? () {
                    Navigator.pop(
                      context,
                      OnChangeLineItemTaxPercent(
                          saleLine:
                          BlocProvider.of<LineItemModificationBloc>(
                              context)
                              .lineItem,
                          taxPercent: taxPercent,
                          reason: "Tax Percent Changed"),
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