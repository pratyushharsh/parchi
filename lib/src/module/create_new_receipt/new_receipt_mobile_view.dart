import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../config/theme_settings.dart';
import '../../widgets/appbar_leading.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/desktop_pop_up.dart';
import '../return_order/return_order_view.dart';
import 'bloc/create_new_receipt_bloc.dart';
import 'new_receipt_view.dart';
import 'new_recipt_desktop_view.dart';

class NewReceiptMobileView extends StatelessWidget {
  const NewReceiptMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.background,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.background,
          body: Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: const [
                    SizedBox(
                      height: 80,
                    ),
                    // CustomerDetailWidget(),
                    CustomerWidget(),
                    SizedBox(
                      height: 10,
                    ),
                    // const Divider(
                    //   thickness: 8,
                    // ),
                    LineItemHeader(),
                    Divider(),
                    Expanded(child: BuildLineItem()),
                    SearchAndAddItem(),
                    Divider(
                      height: 0,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    NewReceiptSummaryWidget(),
                    Divider(),
                    // NewInvoiceButtonBar(),
                  ],
                ),
              ),
              BlocBuilder<CreateNewReceiptBloc, CreateNewReceiptState>(
                builder: (context, state) {
                  return Positioned(
                    top: 20,
                    left: 16,
                    child: AppBarLeading(
                      heading:
                          "Receipt #${state.transSeq > 0 ? state.transSeq : ""}",
                      icon: Icons.arrow_back,
                      onTap: () {
                        if (state.transactionHeader == null) {
                          Navigator.of(context).pop();
                          return;
                        }
                        if (state.step == SaleStep.payment) {
                          BlocProvider.of<CreateNewReceiptBloc>(context)
                              .add(OnChangeSaleStep(SaleStep.item));
                          return;
                        }
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Confirmation"),
                              content: const Text(
                                  "Would you like to cancel the sale transaction?"),
                              actions: [
                                SizedBox(
                                  width: 100,
                                  child: RejectButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    label: 'Cancel',
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: AcceptButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(true);
                                    },
                                    label: 'OK',
                                  ),
                                ),
                              ],
                            );
                          },
                        ).then((value) => {
                              if (value != null && value)
                                {
                                  BlocProvider.of<CreateNewReceiptBloc>(context)
                                      .add(OnCancelTransaction())
                                }
                            });
                      },
                    ),
                  );
                },
              ),
              BlocBuilder<CreateNewReceiptBloc, CreateNewReceiptState>(
                builder: (context, state) {
                  if (state.transactionHeader == null) return const SizedBox();
                  return Positioned(
                      top: 20,
                      right: 16,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 40,
                        width: 40,
                        child: PopupMenuButton<String>(
                          position: PopupMenuPosition.under,
                          color: AppColor.background,
                          padding: EdgeInsets.zero,
                          onSelected: (value) {
                            if (value == "SUSPEND") {
                              BlocProvider.of<CreateNewReceiptBloc>(context)
                                  .add(OnSuspendTransaction());
                            } else if (value == "RETURN") {
                              showTransitiveAppPopUp(
                                title: "Return Order",
                                child: ReturnOrderView(
                                  currentOrderLineItem:
                                      BlocProvider.of<CreateNewReceiptBloc>(
                                              context)
                                          .state
                                          .lineItem,
                                ),
                                context: context,
                              ).then((value) => {
                                    if (value != null)
                                      {
                                        BlocProvider.of<CreateNewReceiptBloc>(
                                                context)
                                            .add(OnReturnLineItemEvent(value))
                                      }
                                  });
                            } else if (value == "CANCEL") {
                              BlocProvider.of<CreateNewReceiptBloc>(context)
                                  .add(OnCancelTransaction());
                            } else if (value == "PARTIAL_PAYMENT") {
                              BlocProvider.of<CreateNewReceiptBloc>(context)
                                  .add(OnPartialPayment());
                            }
                          },
                          itemBuilder: (context) => [
                            if (state.customer != null)
                              PopupMenuItem(
                                child: Row(
                                  children: const [
                                    FaIcon(
                                      FontAwesomeIcons.moneyBills,
                                      color: AppColor.primary,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Partial Pay"),
                                  ],
                                ),
                                value: "PARTIAL_PAYMENT",
                              ),
                            PopupMenuItem(
                              child: Row(
                                children: const [
                                  SizedBox(
                                    width: 30,
                                    child: Center(
                                      child: FaIcon(
                                        FontAwesomeIcons.pause,
                                        color: AppColor.primary,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Suspend Order"),
                                ],
                              ),
                              value: "SUSPEND",
                            ),
                            PopupMenuItem(
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.assignment_return_outlined,
                                    color: AppColor.primary,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Return Order"),
                                ],
                              ),
                              value: "RETURN",
                            ),
                            PopupMenuItem(
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.cancel_sharp,
                                    color: AppColor.primary,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Cancel Order"),
                                ],
                              ),
                              value: "CANCEL",
                            ),
                          ],
                          icon: const Icon(
                            Icons.more_vert,
                            color: AppColor.iconColor,
                          ),
                        ),
                      ));
                },
              ),
            ],
          ),
          bottomNavigationBar: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: NewInvoiceButtonBar(),
          ),
        ),
      ),
    );
  }
}

class AcceptTenderDisplayMobile extends StatelessWidget {
  final Function onTender;
  final double? suggestedAmount;

  const AcceptTenderDisplayMobile(
      {Key? key, required this.onTender, this.suggestedAmount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            body: TenderDisplayDesktop(
          onTender: onTender,
          suggestedAmount: suggestedAmount,
        )),
      ),
    );
  }
}

class CashTender extends StatefulWidget {
  const CashTender({Key? key}) : super(key: key);

  @override
  State<CashTender> createState() => _CashTenderState();
}

class _CashTenderState extends State<CashTender> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.money),
        TextFormField(
          decoration: const InputDecoration(
            labelStyle: TextStyle(fontSize: 18),
            border: InputBorder.none,
          ),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: const TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, letterSpacing: 1.5),
        ),
      ],
    );
  }
}
