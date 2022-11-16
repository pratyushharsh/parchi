import 'package:flutter/material.dart';

import '../../model/model.dart';
import '../../widgets/appbar_leading.dart';
import '../../widgets/custom_text_field.dart';

class ModifyLineItemScreen extends StatelessWidget {
  final SaleLine saleLine;
  const ModifyLineItemScreen({Key? key, required this.saleLine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModifyLineItemForm(saleLine: saleLine,);
  }
}


class ModifyLineItemForm extends StatefulWidget {
  final SaleLine saleLine;
  const ModifyLineItemForm({Key? key, required this.saleLine}) : super(key: key);

  @override
  State<ModifyLineItemForm> createState() => _ModifyLineItemFormState();
}

class _ModifyLineItemFormState extends State<ModifyLineItemForm> {

  late TextEditingController _quantityController;
  late TextEditingController _priceController;
  late TextEditingController _discountController;
  late TextEditingController _taxController;
  late TextEditingController _commentController;


  @override
  void initState() {
    super.initState();
    _quantityController = TextEditingController(text: widget.saleLine.qty.toString());
    _priceController = TextEditingController(text: widget.saleLine.price.toString());
    _discountController = TextEditingController(text: widget.saleLine.discount.toString());
    _taxController = TextEditingController(text: widget.saleLine.tax.toString());
    _commentController = TextEditingController();
  }

  @override
  void dispose() {
    _quantityController.dispose();
    _priceController.dispose();
    _discountController.dispose();
    _taxController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        maintainBottomViewPadding: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Form(
            child: Stack(
              fit: StackFit.expand,
              children: [
                SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 70,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network("https://www.freeiconspng.com/thumbs/no-image-icon/no-image-icon-4.png", height: 100,),
                            const SizedBox(width: 20,),
                            Column(
                              children: [
                                Text(widget.saleLine.product.description, style: const TextStyle(fontWeight: FontWeight.bold),)
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 20,),
                        CustomTextField(
                          label: "Change Quantity",
                          textInputType: TextInputType.number,
                          controller: _quantityController,
                        ),
                        const CustomTextField(
                          label: "Change Price",
                          textInputType: TextInputType.number,
                        ),
                        const CustomTextField(
                          label: "Item Discount",
                        ),
                        const CustomTextField(
                          label: "Item Tax",
                        ),
                        const CustomTextField(
                          label: "Comment",
                          minLines: 5,
                          maxLines: 7,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 16,
                  child: AppBarLeading(
                    heading: "Modify ${widget.saleLine.seq}",
                    icon: Icons.arrow_back,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
