import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/route_config.dart';
import '../../config/theme_settings.dart';
import '../../entity/config/code_value_entity.dart';
import '../../entity/pos/tax_group_entity.dart';
import '../../repositories/tax_repository.dart';
import '../../widgets/appbar_leading.dart';
import '../../widgets/code_value_dropdown.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_checkbox.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/loading.dart';
import '../../widgets/store_user_widget.dart';
import 'bloc/add_new_item_bloc.dart';
import 'product_field_validator.dart';

enum NewItemScreenState { editItem, createItem }

class AddNewItemScreen extends StatelessWidget {
  final String? productId;
  const AddNewItemScreen({Key? key, this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddNewItemBloc(
            productRepository: context.read(),
            configRepository: context.read(),
            taxRepository: context.read(),
            sequenceRepository: context.read(),
          )..add(LoadExistingProduct(productId)),
        )
      ],
      child: AddNewItemForm(editable: productId == null,),
    );
  }
}

class AddNewItemForm extends StatefulWidget {
  final NewItemScreenState status;
  final bool editable;
  const AddNewItemForm({Key? key, this.status = NewItemScreenState.createItem, this.editable = true})
      : super(key: key);

  @override
  State<AddNewItemForm> createState() => _AddNewItemFormState();
}

class _AddNewItemFormState extends State<AddNewItemForm> {
  // void _onSubmit() {
  //   if (_formKey.currentState!.validate()) {
  //     var prod = ProductModel(
  //         productId: _productId,
  //         enable: true,
  //         description: _productNameController.text,
  //         listPrice: _listPriceController.text.isNotEmpty
  //             ? toFloat(_listPriceController.text)
  //             : null,
  //         salePrice: _salePriceController.text.isNotEmpty
  //             ? toFloat(_salePriceController.text)
  //             : null,
  //         purchasePrice: _purchasePriceController.text.isNotEmpty
  //             ? toFloat(_purchasePriceController.text)
  //             : null,
  //         uom: _uom?.description ?? DefaultConfig.uom().code,
  //         brand:
  //             _brandController.text.isNotEmpty ? _brandController.text : null,
  //         hsn: _hsnController.text.isNotEmpty ? _hsnController.text : null,
  //         tax: 0.0,
  //         skuCode: _skuController.text.isNotEmpty ? _skuController.text : null);
  //     BlocProvider.of<ItemBloc>(context).add(AddItem(prod));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNewItemBloc, AddNewItemState>(
      listener: (context, state) {
        if (state.status == AddNewItemStatus.addingProduct) {
          showLoadingDialog(context);
        } else if (state.status == AddNewItemStatus.addingFailure) {
          Navigator.of(context).pop();
          const snackBar = SnackBar(
            content: Text('Error Saving the item in database'),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else if (state.status == AddNewItemStatus.addingSuccess) {
          Navigator.of(context).pop();
          const snackBar = SnackBar(
            content: Text('Successfully Created Product'),
            backgroundColor: Colors.green,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return Container(
          color: AppColor.primary,
          child: SafeArea(
            bottom: false,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Stack(
                fit: StackFit.expand,
                children: [
                  NewItemDetailForm(editable: widget.editable,),
                  Positioned(
                    top: 40,
                    left: 16,
                    child: AppBarLeading(
                      heading: state.existingProduct != null
                          ? (state.existingProduct!.skuCode ?? state.existingProduct!.productId)
                          : "_newProduct",
                      icon: Icons.arrow_back,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  // if (!_inEditMode)
                  BlocBuilder<AddNewItemBloc, AddNewItemState>(
                    builder: (context, state) {
                      if(state.status == AddNewItemStatus.existingProduct || !widget.editable) return Container();
                      return Positioned(
                        top: 20,
                        right: 16,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(RouteConfig.loadItemsInBulkScreen);
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: AppColor.color8,
                            padding: const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                          ),
                          child: const Text(
                            "_bulkImport",
                            style: TextStyle(color: AppColor.primary),
                          ).tr(),
                        ),
                      );
                    },
                  ),
                  if (widget.editable)
                  Positioned(
                    bottom: 10,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Expanded(
                            child: RejectButton(
                                label: "_cancel", onPressed: () {}),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                              child: AcceptButton(
                            label: state.existingProduct != null
                                ? "_update"
                                : "_save",
                            onPressed: () {
                              BlocProvider.of<AddNewItemBloc>(context)
                                  .add(SaveProductEvent());
                            },
                          ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class NewItemDetailForm extends StatefulWidget {
  final bool editable;
  const NewItemDetailForm({Key? key, required this.editable}) : super(key: key);

  @override
  State<NewItemDetailForm> createState() => _NewItemDetailFormState();
}

class _NewItemDetailFormState extends State<NewItemDetailForm> {
  late TextEditingController _productNameController;
  late TextEditingController _productDescriptionController;
  late TextEditingController _salePriceController;
  late TextEditingController _listPriceController;
  late TextEditingController _brandController;
  late TextEditingController _hsnController;
  late TextEditingController _skuController;
  late TextEditingController _colorController;
  late TextEditingController _sizeController;

  @override
  void initState() {
    super.initState();
    _productNameController = TextEditingController();
    _productDescriptionController = TextEditingController();
    _salePriceController = TextEditingController();
    _listPriceController = TextEditingController();
    _brandController = TextEditingController();
    _hsnController = TextEditingController();
    _skuController = TextEditingController();
    _colorController = TextEditingController();
    _sizeController = TextEditingController();
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _productDescriptionController.dispose();
    _salePriceController.dispose();
    _listPriceController.dispose();
    _brandController.dispose();
    _hsnController.dispose();
    _skuController.dispose();
    _colorController.dispose();
    _sizeController.dispose();
    super.dispose();
  }

  void _onSelectedUomChanged(CodeValueEntity? value) {
    if (value != null) {
      BlocProvider.of<AddNewItemBloc>(context).add(UomChangedEvent(value));
    }
  }

  void _onSelectedTaxGroupChanged(TaxGroupEntity? value) {
    if (value != null) {
      BlocProvider.of<AddNewItemBloc>(context)
          .add(TaxGroupIdChangedEvent(value));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNewItemBloc, AddNewItemState>(
      builder: (context, state) {
        if (state.status == AddNewItemStatus.existingProduct) {
          _productNameController.text = state.displayName ?? "";
          _productDescriptionController.text = state.description ?? "";
          _salePriceController.text = state.salePrice?.toString() ?? "";
          _listPriceController.text = state.listPrice?.toString() ?? "";
          _brandController.text = state.brand ?? "";
          _hsnController.text = state.hsn ?? "";
          _skuController.text = state.skuCode ?? "";
          _colorController.text = state.color ?? "";
          _sizeController.text = state.size ?? "";
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              const StoreUserWidget(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    ProductItemsImage(
                      imageUrl: state.imageUrl,
                      editable: widget.editable,
                    ),
                    CustomTextField(
                      label: "_productName",
                      validator: NewProductFieldValidator.validateProductName,
                      controller: _productNameController,
                      onValueChange: (value) {
                        BlocProvider.of<AddNewItemBloc>(context)
                            .add(DisplayNameChangedEvent(value));
                      },
                      minLines: 1,
                      maxLines: 3,
                      enabled: widget.editable,
                    ),
                    CustomTextField(
                      label: "_barcodeSku",
                      controller: _skuController,
                      validator: NewProductFieldValidator.validateSkuData,
                      enabled: widget.editable,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomTextField(
                            label: "_color",
                            controller: _colorController,
                            onValueChange: (value) {
                              BlocProvider.of<AddNewItemBloc>(context)
                                  .add(ColorChangedEvent(value));
                            },
                            enabled: widget.editable,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: CustomTextField(
                            label: "_size",
                            controller: _sizeController,
                            onValueChange: (value) {
                              BlocProvider.of<AddNewItemBloc>(context)
                                  .add(SizeChangedEvent(value));
                            },
                            enabled: widget.editable,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CodeValueDropDown(
                            label: "_uom",
                            onChanged: _onSelectedUomChanged,
                            category: "UOM",
                            value: state.uom,
                            validator: (value) {
                              return NewProductFieldValidator.validateUOM(
                                  value?.code);
                            },
                            enabled: widget.editable,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: CustomTextField(
                            label: "_brand",
                            controller: _brandController,
                            onValueChange: (value) {
                              BlocProvider.of<AddNewItemBloc>(context)
                                  .add(BrandChangedEvent(value));
                            },
                            enabled: widget.editable,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomTextField(
                            label: "_salePrice",
                            textInputType: TextInputType.number,
                            validator: NewProductFieldValidator.validatePrice,
                            controller: _salePriceController,
                            onValueChange: (value) {
                              if (double.tryParse(value) != null) {
                                BlocProvider.of<AddNewItemBloc>(context).add(
                                    SalePriceChangedEvent(double.parse(value)));
                              }
                            },
                            enabled: widget.editable,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: CustomTextField(
                            label: "_listPrice",
                            textInputType: TextInputType.number,
                            validator: NewProductFieldValidator.validatePrice,
                            controller: _listPriceController,
                            onValueChange: (value) {
                              if (double.tryParse(value) != null) {
                                BlocProvider.of<AddNewItemBloc>(context).add(
                                    ListPriceChangedEvent(double.parse(value)));
                              }
                            },
                            enabled: widget.editable,
                          ),
                        ),
                      ],
                    ),
                    CustomTextField(
                      label: "_productDescription",
                      controller: _productDescriptionController,
                      onValueChange: (value) {
                        BlocProvider.of<AddNewItemBloc>(context)
                            .add(DescriptionChangedEvent(value));
                      },
                      minLines: 7,
                      maxLines: 20,
                      enabled: widget.editable,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          // border: Border(
                          //   bottom: BorderSide(color: AppColor.primary),
                          // ),
                          ),
                      child: const Text(
                        "_taxDetail",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: AppColor.primary),
                      ).tr(),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // Row(
                    //   children: [
                    //     CustomCheckbox(
                    //       value: state.priceIncludeTax,
                    //       onChanged: (val) {
                    //         BlocProvider.of<AddNewItemBloc>(context)
                    //             .add(PriceIncludeTaxChangedEvent(val));
                    //       },
                    //     ),
                    //     const SizedBox(
                    //       width: 5,
                    //     ),
                    //     const Text(
                    //       "_priceIncludeTax",
                    //       style: TextStyle(color: Color(0xFF6B7281)),
                    //     ).tr()
                    //   ],
                    // ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Expanded(
                        //   child: CustomTextField(
                        //     label: "_hsn",
                        //     controller: _hsnController,
                        //     enabled: widget.editable,
                        //   ),
                        // ),
                        // const SizedBox(
                        //   width: 8,
                        // ),
                        Expanded(
                          child: CustomDropDown<TaxGroupEntity>(
                            value: state.taxGroupId,
                            label: '_taxGroup',
                            itemAsString: (TaxGroupEntity? value) =>
                                value?.name ?? "",
                            asyncItems: (filter) async {
                              return await RepositoryProvider.of<TaxRepository>(
                                      context)
                                  .getAllTaxGroups();
                            },
                            onChanged: _onSelectedTaxGroupChanged,
                            validator: NewProductFieldValidator.validateTaxGroup,
                            enabled: widget.editable,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 300,
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ProductItemsImage extends StatefulWidget {
  final List<String> imageUrl;
  final bool editable;
  const ProductItemsImage({Key? key, required this.imageUrl, required this.editable}) : super(key: key);
  @override
  State<ProductItemsImage> createState() => _ProductItemsImageState();
}

class _ProductItemsImageState extends State<ProductItemsImage> {
  String selectedUrl = "";

  @override
  void initState() {
    super.initState();
    if (widget.imageUrl.isNotEmpty) {
      selectedUrl = widget.imageUrl[0];
    }
  }

  @override
  void didUpdateWidget(ProductItemsImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (selectedUrl.isEmpty && widget.imageUrl.isNotEmpty) {
      selectedUrl = widget.imageUrl[0];
    }
  }

  Widget _buildHorizontal(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 400,
          width: 400,
          child: selectedUrl.isNotEmpty
              ? CustomImage(
                  url: selectedUrl,
                  imageDim: 600,
                )
              : Container(),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          height: 400,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            direction: Axis.vertical,
            children: [
              ...widget.imageUrl
                  .map((e) => InkWell(
                        onTap: () {
                          setState(() {
                            selectedUrl = e;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColor.primary)),
                          child: CustomImage(
                            url: e,
                            height: 100,
                            width: 100,
                          ),
                        ),
                      ))
                  .toList(),
              if (widget.editable)
              const AddNewItemImage(height: 100, width: 100)
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildVertical(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 32;

    return Column(
      children: [
        selectedUrl.isNotEmpty
            ? GestureDetector(
              onHorizontalDragEnd: (details) {
                if (details.primaryVelocity! > 0) {
                  int index = widget.imageUrl.indexOf(selectedUrl);
                  if (index > 0) {
                    setState(() {
                      selectedUrl = widget.imageUrl[index - 1];
                    });
                  }
                } else {
                  int index = widget.imageUrl.indexOf(selectedUrl);
                  if (index < widget.imageUrl.length - 1) {
                    setState(() {
                      selectedUrl = widget.imageUrl[index + 1];
                    });
                  }
                }
              },
              child: CustomImage(
                  url: selectedUrl,
                  height: width * 0.8,
                  width: width,
                  imageDim: 600,
                ),
            )
            : Container(),
        const SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.center,
          child: Wrap(
            direction: Axis.horizontal,
            runSpacing: 4,
            spacing: 4,
            children: [
              ...widget.imageUrl
                  .map((e) => InkWell(
                        onTap: () {
                          setState(() {
                            selectedUrl = e;
                          });
                        },
                        child: CustomImage(
                          url: e,
                          height: 60,
                          width: 60,
                        ),
                      ))
                  .toList(),
              if (widget.editable)
              const AddNewItemImage()
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return size.width < 600
        ? _buildVertical(context)
        : _buildHorizontal(context);
  }
}

class AddNewItemImage extends StatelessWidget {
  final double height;
  final double width;
  const AddNewItemImage({Key? key, this.height = 60, this.width = 60})
      : super(key: key);

  onImagePick(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: true);
    if (result != null) {
      List<String> urls =
          result.files.map((e) => 'fileRaw:/${e.path!}').toList();
      BlocProvider.of<AddNewItemBloc>(context).add(AddImageUrlsEvent(urls));
    } else {
      // User canceled the picker
      // print("User Cancelled");
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onImagePick(context),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(border: Border.all(color: AppColor.primary)),
        child: const Icon(
          Icons.add_a_photo,
          color: AppColor.primary,
        ),
      ),
    );
  }
}
