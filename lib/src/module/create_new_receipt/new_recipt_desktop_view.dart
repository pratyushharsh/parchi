import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../config/tender_config.dart';
import '../../config/theme_settings.dart';
import '../../util/text_input_formatter/money_editing_controller.dart';
import '../../widgets/custom_dialog.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/desktop_pop_up.dart';
import '../../widgets/extension/retail_extension.dart';
import '../../widgets/keypad_overlay/keypad_overlay.dart';
import '../../widgets/store_user_widget.dart';
import '../../widgets/timer.dart';
import '../authentication/bloc/authentication_bloc.dart';
import '../calculator/calculator.dart';
import '../item_search/bloc/item_search_bloc.dart';
import '../return_order/return_order_view.dart';
import 'bloc/create_new_receipt_bloc.dart';
import 'new_receipt_view.dart';

class NewReceiptDesktopView extends StatelessWidget {
  const NewReceiptDesktopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.background,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.background,
          body: BlocProvider(
            lazy: true,
            create: (ctx) =>
                ItemSearchBloc(productRepository: RepositoryProvider.of(ctx)),
            child: BlocConsumer<CreateNewReceiptBloc, CreateNewReceiptState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Column(
                      children: [
                        // Container(
                        //   color: Colors.purple,
                        //   height: 35,
                        //   child: Row(
                        //     children: const [
                        //       Text("Header"),
                        //     ],
                        //   ),
                        // ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const ActionDesktopButtonBar(),
                              if (SaleStep.item == state.step ||
                                  SaleStep.complete == state.step)
                                const Expanded(
                                    child: SearchUserDisplayDesktop()),
                              if (SaleStep.payment == state.step)
                                Expanded(
                                    child: TenderDisplayDesktop(
                                  suggestedAmount: state.amountDue,
                                )),
                              const Expanded(child: SaleReturnDisplayDesktop()),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.black,
                          height: 40,
                          child: BlocBuilder<AuthenticationBloc,
                              AuthenticationState>(
                            builder: (context, state) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${state.employee?.firstName} ${state.employee?.lastName}",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    "${state.store?.storeName}",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const TimerWidget()
                                ],
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class SearchUserDisplayDesktop extends StatefulWidget {
  const SearchUserDisplayDesktop({Key? key}) : super(key: key);

  @override
  State<SearchUserDisplayDesktop> createState() =>
      _SearchUserDisplayDesktopState();
}

class _SearchUserDisplayDesktopState extends State<SearchUserDisplayDesktop> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ItemSearchBloc, ItemSearchState>(
      listener: (context, state) {
        if (state.filter.filterText.isEmpty) {
          _searchController.text = "";
        }
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: CustomerWidget(),
            ),
            const Positioned(
              bottom: 90,
              left: 0,
              right: 0,
              child: SearchItemProductsListDesktop(),
            ),
            Positioned(
              bottom: -4,
              left: 0,
              right: 0,
              child: CustomTextField(
                label: "_searchForProducts",
                controller: _searchController,
                onValueChange: (val) {
                  BlocProvider.of<ItemSearchBloc>(context)
                      .add(SearchItemByFilter(val));
                },
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SearchItemProductsListDesktop extends StatelessWidget {
  const SearchItemProductsListDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemSearchBloc, ItemSearchState>(
        builder: (builder, state) {
      if (state.products.isNotEmpty) {
        return Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: state.products
                .map((p) => InkWell(
                      onTap: () {
                        BlocProvider.of<CreateNewReceiptBloc>(context)
                            .add(AddItemToReceipt(p));
                        BlocProvider.of<ItemSearchBloc>(context)
                            .add(SearchItemByFilter(""));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            p.imageUrl.isNotEmpty
                                ? CustomImage(
                                    url: p.imageUrl[0],
                                    width: 50,
                                    height: 50,
                                  )
                                : const SizedBox(
                                    height: 50,
                                    width: 50,
                                  ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(p.productId ?? p.skuCode ?? "Invalid"),
                                  Text(
                                    p.displayName,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                      "${(p.salePrice != null && p.salePrice! > 0) ? p.salePrice : p.listPrice} | ${p.listPrice}"),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Divider(
                                    height: 0,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
        );
      }
      return Container();
    });
  }
}

class SaleReturnDisplayDesktop extends StatelessWidget {
  const SaleReturnDisplayDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SaleHeaderBlock(),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: const [
                LineItemHeader(),
                Divider(),
                Expanded(
                  child: BuildLineItem(),
                ),
                NewReceiptSummaryDesktopWidget(),
                NewInvoiceButtonBar()
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TenderDisplayDesktop extends StatefulWidget {
  final Function? onTender;
  final double? suggestedAmount;
  const TenderDisplayDesktop({Key? key, this.onTender, this.suggestedAmount})
      : super(key: key);

  @override
  State<TenderDisplayDesktop> createState() => _TenderDisplayDesktopState();
}

class _TenderDisplayDesktopState extends State<TenderDisplayDesktop> {
  String selectedTender = "";
  late MoneyEditingController tenderController;
  late FocusNode tenderFocusNode;

  @override
  void initState() {
    super.initState();
    tenderController =
        MoneyEditingController(formatter: getCurrencyFormatter(context));
    tenderFocusNode = FocusNode();
  }

  @override
  void dispose() {
    tenderController.dispose();
    tenderFocusNode.dispose();
    super.dispose();
  }

  void onSelectNewTender(String val) {
    setState(() {
      selectedTender = val;
      tenderController.text =
          getCurrencyFormatter(context).format(widget.suggestedAmount);
    });
    FocusScope.of(context).requestFocus(tenderFocusNode);
  }

  double validAmount() {
    try {
      MoneyTextEditingValue amount =
          tenderController.value as MoneyTextEditingValue;
      return amount.moneyValue;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: Text(
              "_tenderAmount".tr(namedArgs: {
                "amount": widget.suggestedAmount != null
                    ? getCurrencyFormatter(context).format(widget.suggestedAmount)
                    : ""
              }),
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: 0,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    tenderIconMapping["OTHER"]!,
                    const SizedBox(
                      height: 50,
                    ),
                    TenderAmountTextField(
                      controller: tenderController,
                      selectedTender: selectedTender,
                      focusNode: tenderFocusNode,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DisplayTenderList(
                      selectedTender: selectedTender,
                      onSelectNewTender: onSelectNewTender,
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Row(
              children: [
                Expanded(
                  child: RejectButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    label: "Cancel",
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: AcceptButton(
                    onPressed: validAmount() > 0
                        ? () {
                            if (widget.onTender != null) {
                              widget.onTender!(OnAddNewTenderLine(
                                  tenderType: selectedTender,
                                  amount: validAmount()));
                            } else {
                              BlocProvider.of<CreateNewReceiptBloc>(context)
                                  .add(OnAddNewTenderLine(
                                      tenderType: selectedTender,
                                      amount: validAmount()));
                            }
                            onSelectNewTender('');
                            tenderController.text = '';
                            if (Platform.isIOS || Platform.isAndroid) {
                              Navigator.of(context).pop();
                            }
                          }
                        : null,
                    label: "Accept Payment",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DisplayTenderList extends StatelessWidget {
  final String selectedTender;
  final Function onSelectNewTender;
  const DisplayTenderList(
      {Key? key, required this.selectedTender, required this.onSelectNewTender})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: tenderList
          .map(
            (e) => TenderListDisplayCard(
                tenderType: e,
                selected: selectedTender == e,
                onSelectNewTender: onSelectNewTender),
          )
          .toList(),
    );
  }
}

class TenderListDisplayCard extends StatelessWidget {
  final String tenderType;
  final bool selected;
  final Function onSelectNewTender;
  const TenderListDisplayCard(
      {Key? key,
      required this.tenderType,
      this.selected = false,
      required this.onSelectNewTender})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // shadowColor: Colors.green,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: selected ? Colors.green : Colors.transparent, width: 3),
        // borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: () {
          onSelectNewTender(tenderType);
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          height: 80,
          width: 120,
          color: selected ? Colors.green[50] : Colors.transparent,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                tenderIconMapping[tenderType] ??
                    tenderIconMapping["OTHER"]!,
                const SizedBox(height: 5),
                Text(tenderType)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NewReceiptSummaryDesktopWidget extends StatelessWidget {
  const NewReceiptSummaryDesktopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateNewReceiptBloc, CreateNewReceiptState>(
      builder: (context, state) {
        return Column(
          children: [
            Container(
              color: Colors.black,
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                    child: RetailSummaryDetailRow(
                      mainAxisAlignment: MainAxisAlignment.start,
                      title: "Items:\t\t",
                      value: state.items.toString(),
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: RetailSummaryDetailRow(
                      mainAxisAlignment: MainAxisAlignment.end,
                      title: "Tax:\t",
                      value: getCurrencyFormatter(context).format(state.tax),
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: RetailSummaryDetailRow(
                      mainAxisAlignment: MainAxisAlignment.end,
                      title: "Sub Total:\t",
                      value:
                          getCurrencyFormatter(context).format(state.subTotal),
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            RetailSummaryDetailRow(
              title: "Amount Due",
              value: getCurrencyFormatter(context).format(state.amountDue),
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const Divider(),
          ],
        );
      },
    );
  }
}

class TenderAmountTextField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String selectedTender;

  const TenderAmountTextField(
      {Key? key,
      required this.controller,
      required this.selectedTender,
      required this.focusNode})
      : super(key: key);

  @override
  State<TenderAmountTextField> createState() => _TenderAmountTextFieldState();
}

class _TenderAmountTextFieldState extends State<TenderAmountTextField> {
  final GlobalKey _overlayKey = GlobalKey();
  bool _isNodeFocus = false;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    widget.focusNode.removeListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      if (!Platform.isAndroid) {
        _isNodeFocus = widget.focusNode.hasFocus;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeypadOverlay(
      overlayPadding: const EdgeInsets.all(0),
      gKey: _overlayKey,
      showOverlay: _isNodeFocus,
      child: TextFormField(
        enabled: widget.selectedTender.isNotEmpty,
        focusNode: widget.focusNode,
        controller: widget.controller,
        autocorrect: false,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 70,
        ),
        keyboardType: TextInputType.number,
        cursorColor: Colors.black,
      ),
      overlayWidget: Keypad(
        controller: widget.controller,
      ),
    );
  }
}

class ActionDesktopButtonBar extends StatelessWidget {
  const ActionDesktopButtonBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateNewReceiptBloc, CreateNewReceiptState>(
      builder: (context, state) {
        return Container(
          width: 75,
          decoration: const BoxDecoration(
            border: Border(right: BorderSide(color: Colors.black26)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DesktopActionBarButton(
                icon: const Icon(Icons.cancel_presentation_outlined),
                onPressed: () {
                  yesOrCancelDialog(
                    context,
                    "Confirmation",
                    content: "Would you like to suspend the transaction?",
                  ).then((value) => {
                        if (value != null && value)
                          {
                            BlocProvider.of<CreateNewReceiptBloc>(context)
                                .add(OnSuspendTransaction())
                          }
                      });
                },
                label: "Suspend",
                tooltip: "Suspend Transaction",
              ),
              DesktopActionBarButton(
                icon: const Icon(Icons.assignment_return_outlined),
                onPressed: () {
                  showTransitiveAppPopUp(
                    title: "Return Order",
                    child: ReturnOrderView(
                      currentOrderLineItem:
                          BlocProvider.of<CreateNewReceiptBloc>(context)
                              .state
                              .lineItem,
                    ),
                    context: context,
                  ).then((value) => {
                        if (value != null)
                          {
                            BlocProvider.of<CreateNewReceiptBloc>(context)
                                .add(OnReturnLineItemEvent(value))
                          }
                      });
                },
                label: "Return",
                tooltip: "Return Item",
                borderTop: false,
              ),
              if (state.customer != null)
                DesktopActionBarButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.moneyBills,
                  ),
                  onPressed: () {
                    yesOrCancelDialog(
                      context,
                      "Confirmation",
                      content:
                          "Would you accept partial payment on this transaction?",
                    ).then((value) => {
                          if (value != null && value)
                            {
                              BlocProvider.of<CreateNewReceiptBloc>(context)
                                  .add(OnPartialPayment())
                            }
                        });
                  },
                  label: "Partial Pay",
                  tooltip: "Partial Payment Transaction",
                  borderTop: false,
                ),
              IconButton(
                icon: const Icon(Icons.settings_accessibility),
                onPressed: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}

class DesktopActionBarButton extends StatelessWidget {
  final void Function() onPressed;
  final String? tooltip;
  final String label;
  final Widget icon;
  final bool borderTop;
  final bool borderBottom;
  const DesktopActionBarButton(
      {Key? key,
      required this.onPressed,
      this.tooltip,
      required this.label,
      required this.icon,
      this.borderTop = true,
      this.borderBottom = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip ?? label,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
          decoration: BoxDecoration(
            border: Border(
              top: borderTop
                  ? const BorderSide(color: Colors.black26)
                  : BorderSide.none,
              bottom: borderBottom
                  ? const BorderSide(color: Colors.black26)
                  : BorderSide.none,
            ),
          ),
          width: double.infinity,
          child: Column(
            children: [
              icon,
              Text(label),
            ],
          ),
        ),
      ),
    );
  }
}
