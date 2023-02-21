import 'dart:io';
import 'dart:math';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../config/route_config.dart';
import '../../config/theme_settings.dart';
import '../../entity/pos/address.dart';
import '../../entity/pos/entity.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_dialog.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/desktop_pop_up.dart';
import '../../widgets/extension/retail_extension.dart';
import '../business/business_view.dart';
import '../customer_search/bloc/customer_search_bloc.dart';
import '../customer_search/customer_search_widget.dart';
import '../item_search/item_search_view.dart';
import '../line_item_modification/line_item_modification_view.dart';
import '../return_order/return_order_view.dart';
import 'bloc/create_new_receipt_bloc.dart';
import 'new_receipt_mobile_view.dart';
import 'new_recipt_desktop_view.dart';
import 'sale_complete_dialog.dart';

class NewReceiptView extends StatelessWidget {
  final String? transId;
  final bool isReturn;
  const NewReceiptView({Key? key, this.transId, this.isReturn = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (ctx) => CreateNewReceiptBloc(
            authenticationBloc: BlocProvider.of(ctx),
            sequenceRepository: RepositoryProvider.of(ctx),
            transactionRepository: RepositoryProvider.of(ctx),
            productRepository: RepositoryProvider.of(ctx),
            customerRepository: RepositoryProvider.of(ctx),
            taxHelper: RepositoryProvider.of(ctx),
            taxModifierCalculator: RepositoryProvider.of(ctx),
            priceHelper: RepositoryProvider.of(ctx),
            discountHelper: RepositoryProvider.of(ctx),
            errorNotificationBloc: BlocProvider.of(ctx),
            dealsHelper: RepositoryProvider.of(ctx),
            priceCalculator: RepositoryProvider.of(ctx),
            totalCalculator: RepositoryProvider.of(ctx),
            dealsCalculator: RepositoryProvider.of(ctx),
          )..add(
              OnInitiateNewTransaction(transSeq: transId, isReturn: isReturn)),
        ),
        BlocProvider(
          create: (ctx) => CustomerSearchBloc(
            contactDb: RepositoryProvider.of(ctx),
          ),
        ),
      ],
      child: BlocListener<CreateNewReceiptBloc, CreateNewReceiptState>(
        listener: (context, state) {
          if (state.isReturn && state.transSeq.isEmpty) {
            showTransitiveAppPopUp(
              title: "Return Order",
              child: const ReturnOrderView(
                currentOrderLineItem: [],
              ),
              context: context,
            ).then((value) => {
                  if (value != null)
                    {
                      BlocProvider.of<CreateNewReceiptBloc>(context)
                          .add(OnReturnLineItemEvent(value))
                    }
                });
          }

          if (state.step == SaleStep.printAndEmail) {
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => const SaleCompleteDialog(),
            //   ),
            // );
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (ctx) => Dialog(
                child: SizedBox(
                  width: min(MediaQuery.of(context).size.width * 0.8, 600),
                  height: 450,
                  child: SaleCompleteDialog(
                    customer: state.customer,
                  ),
                ),
              ),
            ).then((value) => {
                  if (value != null)
                    {
                      Navigator.of(context).pop(),
                    }
                });
          } else if (state.step == SaleStep.confirmed) {
            Navigator.of(context).pop();
          }
        },
        child: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: LayoutBuilder(
            builder: (context, constrain) {
              if (constrain.maxWidth > 800) {
                return const NewReceiptDesktopView();
              } else {
                return const NewReceiptMobileView();
              }
            },
          ),
        ),
      ),
    );
  }
}

class CustomerSuggestionWidget extends StatelessWidget {
  final ContactEntity contactEntity;
  const CustomerSuggestionWidget({Key? key, required this.contactEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          BlocProvider.of<CreateNewReceiptBloc>(context)
              .add(OnCustomerSelect(contactEntity));
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                "${contactEntity.firstName} | ${contactEntity.phoneNumber ?? ''}",
                overflow: TextOverflow.ellipsis,
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class VoidWidget extends StatelessWidget {
  final int count;
  const VoidWidget({Key? key, this.count = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                    List.generate(count, (index) => index, growable: false)
                        .map(
                          (e) => const Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                        )
                        .toList(),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "Void",
              style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w100,
                  fontSize: 25,
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                    List.generate(count, (index) => index, growable: false)
                        .map(
                          (e) => const Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                        )
                        .toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class BuildLineItem extends StatelessWidget {
  const BuildLineItem({Key? key}) : super(key: key);

  void onTap(BuildContext context, TransactionLineItemEntity saleLine,
      ItemEntity? product) {
    showTransitiveAppPopUp(
            context: context,
            title: "Modify Line Item",
            child: LineItemModificationView(
                lineItem: saleLine, productModel: product))
        .then(
      (value) => {
        if (value != null && value is CreateNewReceiptEvent)
          {BlocProvider.of<CreateNewReceiptBloc>(context).add(value)}
      },
    );
  }

  bool canLineItemModified(
      TransactionHeaderEntity header, TransactionLineItemEntity saleLine) {
    if (saleLine.returnFlag || saleLine.isVoid) {
      return false;
    }

    if (header.status == TransactionStatus.partialPayment) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateNewReceiptBloc, CreateNewReceiptState>(
        builder: (context, state) {
      return ListView.builder(
          itemCount: state.lineItem.length + state.tenderLine.length,
          itemBuilder: (itemBuilder, idx) {
            if (idx < state.lineItem.length) {
              return InkWell(
                onTap: canLineItemModified(
                        state.transactionHeader!, state.lineItem[idx])
                    ? () {
                        onTap(context, state.lineItem[idx],
                            state.productMap[state.lineItem[idx].itemId]);
                      }
                    : null,
                child: Stack(
                  children: [
                    Opacity(
                      opacity: state.lineItem[idx].isVoid ? 0.45 : 1,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: state.lineItem[idx].returnFlag
                                    ? Colors.redAccent
                                    : Colors.blueAccent,
                                width: 8,
                              ),
                            ),
                            color: idx % 2 == 0
                                ? AppColor.headerBackground.withOpacity(0.5)
                                : null),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: NewLineItem(
                                saleLine: state.lineItem[idx],
                                productModel: state
                                    .productMap[state.lineItem[idx].itemId],
                              ),
                            ),
                            const Divider(
                              height: 0,
                            )
                          ],
                        ),
                      ),
                    ),
                    if (state.lineItem[idx].isVoid)
                      const Positioned(
                        top: 0,
                        right: 0,
                        bottom: 0,
                        left: 0,
                        child: VoidWidget(count: 5),
                      ),
                  ],
                ),
              );
            }

            if (idx >= state.lineItem.length) {
              return InkWell(
                onTap: () {
                  yesOrCancelDialog(context, "Void Tender",
                          content: "Are you sure you want to void this tender?")
                      .then((value) {
                    if (value != null && value) {
                      BlocProvider.of<CreateNewReceiptBloc>(context).add(
                          OnTenderLineVoid(
                              tenderLine: state
                                  .tenderLine[idx - state.lineItem.length]));
                    }
                  });
                },
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Opacity(
                          opacity: state.tenderLine[idx - state.lineItem.length]
                                  .isVoid
                              ? 0.45
                              : 1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: TenderLineDisplay(
                              tenderLine:
                                  state.tenderLine[idx - state.lineItem.length],
                            ),
                          ),
                        ),
                        const Divider(
                          height: 0,
                        )
                      ],
                    ),
                    if (state.tenderLine[idx - state.lineItem.length].isVoid)
                      const Positioned(
                        top: 0,
                        right: 0,
                        bottom: 0,
                        left: 0,
                        child: VoidWidget(),
                      ),
                  ],
                ),
              );
            }
            return Container();
          });
    });
  }
}

class SearchAndAddItem extends StatelessWidget {
  const SearchAndAddItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(context: context, builder: (ctx) => const SearchItemBox())
            .then((value) => {
                  if (value != null)
                    {
                      BlocProvider.of<CreateNewReceiptBloc>(context)
                          .add(AddItemToReceipt(value))
                    }
                });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: AppColor.headerBackground.withOpacity(0.5),
        child: Row(
          children: [
            const Icon(Icons.add),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "_searchForProducts",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ).tr()
          ],
        ),
      ),
    );
  }
}

class SearchItemBox extends StatefulWidget {
  const SearchItemBox({Key? key}) : super(key: key);

  @override
  _SearchItemBoxState createState() => _SearchItemBoxState();
}

class _SearchItemBoxState extends State<SearchItemBox> {
  Widget contentBox(BuildContext context) {
    return const SearchItemView();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 8),
      elevation: 0,
      alignment: const Alignment(0, -0.5),
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }
}

class LineItemHeader extends StatelessWidget {
  const LineItemHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 800) {
        return Row(
          children: [
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "_item".tr(),
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "_unitCost".tr(),
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "_qty".tr(),
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "_amount".tr(),
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        );
      }

      return Row(
        children: const [
          Expanded(
            flex: 2,
            child: Text(
              "Product Description",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "UnitCost",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Qty",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Amount",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      );
    });
  }
}

class TenderLineDisplay extends StatelessWidget {
  final TransactionPaymentLineItemEntity tenderLine;
  const TenderLineDisplay({Key? key, required this.tenderLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Row(
        children: [
          const SizedBox(
            width: 50,
            child: Icon(Icons.currency_exchange),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                '${tenderLine.currencyId}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(tenderLine.tenderId!))),
          Expanded(
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    getCurrencyFormatter(context).format(tenderLine.amount!),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ))),
        ],
      ),
    );
  }
}

class NewLineItem extends StatelessWidget {
  final TransactionLineItemEntity saleLine;
  final ItemEntity? productModel;

  const NewLineItem({Key? key, required this.saleLine, this.productModel})
      : super(key: key);

  static const textStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(RouteConfig.editItemScreen,
                      arguments: productModel!.productId!);
                },
                child: Container(
                  decoration: BoxDecoration(border: Border.all(width: 1)),
                  child: (productModel != null &&
                          productModel!.imageUrl.isNotEmpty)
                      ? CustomImage(
                          url: productModel!.imageUrl[0],
                        )
                      : Image.network(
                          "https://cdn.iconscout.com/icon/premium/png-128-thumb/no-image-2840056-2359564.png",
                          fit: BoxFit.cover,
                          height: 70,
                          width: 70,
                          errorBuilder: (context, obj, trace) {
                            return const SizedBox(
                              height: 70,
                              width: 70,
                            );
                          },
                        ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(saleLine.itemId!),
                    Text(saleLine.itemDescription!),
                    Text(
                      '${saleLine.itemId!} - ${(saleLine.itemColor != null && saleLine.itemColor!.isNotEmpty) ? '${saleLine.itemColor}' : ''} ${(saleLine.itemSize != null && saleLine.itemSize!.isNotEmpty) ? '- ${saleLine.itemSize}' : ''}',
                      style: NewLineItem.textStyle,
                    ),
                    // Build Rounded container for color and size
                  ],
                ),
              )
            ],
          ),
          LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth < 800) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        getCurrencyFormatter(context).format(
                            saleLine.priceOverride
                                ? saleLine.unitPrice
                                : saleLine.baseUnitPrice),
                        style: NewLineItem.textStyle,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        saleLine.quantity.toString(),
                        style: NewLineItem.textStyle,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        getCurrencyFormatter(context)
                            .format(saleLine.netAmount),
                        style: NewLineItem.textStyle,
                      ),
                    ),
                  ),
                ],
              );
            }

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      getCurrencyFormatter(context).format(
                          saleLine.priceOverride
                              ? saleLine.unitPrice
                              : saleLine.baseUnitPrice),
                      style: NewLineItem.textStyle,
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      saleLine.quantity.toString(),
                      style: NewLineItem.textStyle,
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      getCurrencyFormatter(context).format(saleLine.netAmount),
                      style: NewLineItem.textStyle,
                    ),
                  ),
                ),
              ],
            );
          }),
          ...saleLine.lineModifiers
              .map(
                (e) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 8, top: 4),
                          child: Icon(
                            Icons.discount,
                            color: Colors.brown,
                            size: 16,
                          ),
                        ),
                        Text(e.description ?? ""),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 60),
                      child: Text(
                        getCurrencyFormatter(context).format(-e.amount),
                        style: NewLineItem.textStyle,
                      ),
                    ),
                  ],
                ),
              )
              .toList()
        ],
      ),
    );
  }
}

class NewInvoiceButtonBar extends StatelessWidget {
  const NewInvoiceButtonBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateNewReceiptBloc, CreateNewReceiptState>(
      listener: (context, state) => {
        if (state.status == CreateNewReceiptStatus.paymentAwaiting)
          {
            Navigator.of(context).popAndPushNamed(
                RouteConfig.receiptDisplayScreen,
                arguments: state.transSeq)
          }
        else if (state.step == SaleStep.complete)
          {
            BlocProvider.of<CreateNewReceiptBloc>(context)
                .add(OnChangeSaleStep(SaleStep.complete))
          }
      },
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(top: 0, bottom: 8),
          child: Row(
            children: [
              Expanded(
                child: RejectButton(
                  onPressed: () {
                    if (!state.inProgress) {
                      Navigator.of(context).pop();
                      return;
                    }

                    // @TODO Void All the tender
                    if (state.transactionHeader == null) {
                      Navigator.of(context).pop();
                      return;
                    }

                    if (state.step == SaleStep.payment) {
                      BlocProvider.of<CreateNewReceiptBloc>(context)
                          .add(OnChangeSaleStep(SaleStep.item));
                      return;
                    }
                    yesOrCancelDialog(
                      context,
                      "_cancelTransaction",
                      content: "_cancelTransactionLabel",
                    ).then((value) => {
                          if (value != null && value)
                            {
                              BlocProvider.of<CreateNewReceiptBloc>(context)
                                  .add(OnCancelTransaction())
                            }
                        });
                  },
                  label: '_cancel',
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              if (state.step == SaleStep.item || state.step == SaleStep.payment)
                Expanded(
                  child: AcceptButton(
                    onPressed: state.transSeq.isNotEmpty &&
                            state.lineItem.isNotEmpty
                        ? () {
                            BlocProvider.of<CreateNewReceiptBloc>(context)
                                .add(OnChangeSaleStep(SaleStep.payment));
                            if (Platform.isIOS || Platform.isAndroid) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => AcceptTenderDisplayMobile(
                                        onTender: BlocProvider.of<
                                                CreateNewReceiptBloc>(context)
                                            .add,
                                        suggestedAmount: state.amountDue,
                                      )));
                            }
                          }
                        : null,
                    label: "_proceedToPay",
                  ),
                ),
              if (state.step == SaleStep.complete)
                Expanded(
                  child: AcceptButton(
                    onPressed: () {
                      BlocProvider.of<CreateNewReceiptBloc>(context)
                          .add(OnChangeSaleStep(SaleStep.complete));
                    },
                    label: "_completeSale",
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
//OnChangeSaleStep
// showDialog(
// context: context,
// builder: (BuildContext context) {
// return AlertDialog(
// title: const Text("Sale Confirmation"),
// content: const Text(
// "Would you like to continue the sale transaction?"),
// actions: [
// ElevatedButton(
// child: const Text("Cancel"),
// onPressed: () {
// Navigator.of(context).pop();
// },
// ),
// ElevatedButton(
// child: const Text("Continue"),
// onPressed: () {
// Navigator.of(context).pop(true);
// },
// ),
// ],
// );
// },
// ).then((value) => {
// if (value != null && value)
// {
// BlocProvider.of<CreateNewReceiptBloc>(
// context)
//     .add(OnCreateNewTransaction())
// }
// });

class NewReceiptSummaryWidget extends StatelessWidget {
  const NewReceiptSummaryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateNewReceiptBloc, CreateNewReceiptState>(
      builder: (context, state) {
        return Column(
          children: [
            RetailSummaryDetailRow(
              title: "_totalQty",
              value: state.items.toString(),
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.black54),
            ),
            RetailSummaryDetailRow(
              title: "_subtotal",
              value: getCurrencyFormatter(context).format(state.subTotal),
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.black54),
            ),
            RetailSummaryDetailRow(
              title: "_discount",
              value: getCurrencyFormatter(context).format(state.discount),
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.black54),
            ),
            RetailSummaryDetailRow(
              title: "_tax",
              value: getCurrencyFormatter(context).format(state.tax),
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.black54),
            ),
            const Divider(),
            RetailSummaryDetailRow(
              title: "_amountDue",
              value: getCurrencyFormatter(context).format(state.amountDue),
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        );
      },
    );
  }
}

class RetailSummaryDetailRow extends StatelessWidget {
  final String title;
  final String value;
  final TextStyle? textStyle;
  final MainAxisAlignment mainAxisAlignment;

  const RetailSummaryDetailRow(
      {Key? key,
      required this.title,
      required this.value,
      this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        SelectableText(
          title.tr(),
          style: textStyle,
        ),
        SelectableText(
          value,
          style: textStyle,
        )
      ],
    );
  }
}

class SaleCustomerMobile extends StatelessWidget {
  final ContactEntity customer;
  const SaleCustomerMobile({Key? key, required this.customer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(customer.firstName), Text('${customer.phoneNumber}')],
    );
  }
}

class SaleHeaderBlock extends StatelessWidget {
  const SaleHeaderBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateNewReceiptBloc, CreateNewReceiptState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          height: 35,
          color: Colors.black,
          child: Row(
            children: [
              Text(
                'Transaction No# ${state.transSeq}',
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              )
            ],
          ),
        );
      },
    );
  }
}

class CustomerWidget extends StatefulWidget {
  const CustomerWidget({Key? key}) : super(key: key);

  @override
  State<CustomerWidget> createState() => _CustomerWidgetState();
}

class _CustomerWidgetState extends State<CustomerWidget> {
  bool isAddressOpen = false;

  @override
  void initState() {
    super.initState();
    if (Platform.isMacOS || Platform.isWindows) {
      isAddressOpen = true;
    }
  }

  bool canCustomerModified(TransactionHeaderEntity? transaction) {
    if (transaction != null &&
        transaction.status == TransactionStatus.partialPayment) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: BlocBuilder<CreateNewReceiptBloc, CreateNewReceiptState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: !state.isCustomerPresent
                ? () {
                    if (Platform.isMacOS || Platform.isWindows) {
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (ctx) => Dialog(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.8,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: const CustomerSearch(),
                          ),
                        ),
                      ).then((value) => {
                            if (value != null && value is OnCustomerSelect)
                              {
                                BlocProvider.of<CreateNewReceiptBloc>(context)
                                    .add(value)
                              }
                          });
                    } else {
                      Navigator.of(context)
                          .push(
                            MaterialPageRoute(
                              builder: (context) => const CustomerSearch(),
                            ),
                          )
                          .then((value) => {
                                if (value != null && value is OnCustomerSelect)
                                  {
                                    BlocProvider.of<CreateNewReceiptBloc>(
                                            context)
                                        .add(value)
                                  }
                              });
                    }
                  }
                : () {
                    setState(() {
                      isAddressOpen = !isAddressOpen;
                    });
                  },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 2000),
              child: Column(
                children: [
                  Container(
                    color: AppColor.headerBackground,
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.circleUser,
                                color: AppColor.primary,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.isCustomerPresent
                                          ? state.customer!.firstName
                                          : "_addCustomer".tr(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: AppColor.primary),
                                    ),
                                    if (state.isCustomerPresent &&
                                        state.customer != null &&
                                        state.customer!.phoneNumber != null)
                                      Text(
                                        'Phone: ${state.customer!.phoneNumber!}',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: AppColor.primary),
                                      ),
                                    if (state.isCustomerPresent &&
                                        state.customer != null &&
                                        state.customer!.email != null)
                                      Text(
                                        'Email: ${state.customer!.email!}',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: AppColor.primary),
                                      ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        if (!state.isCustomerPresent &&
                            canCustomerModified(state.transactionHeader))
                          const FaIcon(
                            FontAwesomeIcons.personCirclePlus,
                            color: AppColor.primary,
                          ),
                        if (state.isCustomerPresent &&
                            canCustomerModified(state.transactionHeader))
                          InkWell(
                            onTap: () {
                              BlocProvider.of<CreateNewReceiptBloc>(context)
                                  .add(OnCustomerRemove());
                            },
                            child: const FaIcon(
                              FontAwesomeIcons.circleXmark,
                              color: AppColor.primary,
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (isAddressOpen && state.isCustomerPresent)
                    IntrinsicHeight(
                      child: Row(
                        children: const [
                          Expanded(
                            child: CustomerAddress(
                              margin: EdgeInsets.only(top: 10, right: 5),
                              type: AddressType.billing,
                            ),
                          ),
                          Expanded(
                            child: CustomerAddress(
                              margin: EdgeInsets.only(top: 10, left: 5),
                              type: AddressType.shipping,
                            ),
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

enum AddressType {
  billing,
  shipping,
}

class CustomerAddress extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final AddressType type;
  const CustomerAddress(
      {Key? key, this.margin = const EdgeInsets.all(16), required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateNewReceiptBloc, CreateNewReceiptState>(
      builder: (context, state) {
        Address? address;

        if (type == AddressType.billing) {
          address = state.customerAddress?.billingAddress;
        } else {
          address = state.customerAddress?.shippingAddress;
        }

        return GestureDetector(
          onTap: () {
            showTransitiveAppPopUp(
                    context: context, child: const AddressFormDialog())
                .then((value) => {
                      if (value != null && value is Address)
                        {
                          if (type == AddressType.billing)
                            {
                              BlocProvider.of<CreateNewReceiptBloc>(context)
                                  .add(OnChangeCustomerBillingAddress(value))
                            }
                          else if (type == AddressType.shipping)
                            {
                              BlocProvider.of<CreateNewReceiptBloc>(context)
                                  .add(OnChangeCustomerShippingAddress(value))
                            }
                        }
                    });
          },
          child: Container(
            margin: margin,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Container(
                color: AppColor.headerBackground,
                padding: const EdgeInsets.all(15),
                child: address != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            type == AddressType.billing
                                ? 'Billing Address:'
                                : 'Shipping Address:',
                            style: const TextStyle(
                                fontSize: 18,
                                color: AppColor.primary,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '${address.address1} ${address.address2}',
                            style: const TextStyle(
                                fontSize: 16, color: AppColor.primary),
                          ),
                          Text(
                            '${address.city}, ${address.state} ${address.zipcode}',
                            style: const TextStyle(
                                fontSize: 16, color: AppColor.primary),
                          ),
                          Text(
                            '${address.country}',
                            style: const TextStyle(
                                fontSize: 16, color: AppColor.primary),
                          ),
                        ],
                      )
                    : Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.pin_drop_outlined,
                              color: AppColor.primary,
                              size: 40,
                            ),
                            Text(
                              'Add ${type == AddressType.billing ? 'Billing' : 'Shipping'} Address',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                color: AppColor.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
