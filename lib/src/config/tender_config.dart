import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const tenderList = ["CASH", "CARD", "CHECK", "UPI", "STORE CREDIT", "GIFT CARD"];

Map<String, IconData> tenderIconMapping = {
  "CASH": FontAwesomeIcons.moneyBill,
  "CARD": FontAwesomeIcons.creditCard,
  "CHECK": FontAwesomeIcons.moneyCheck,
  "GIFT CARD": FontAwesomeIcons.gift,
  "STORE CREDIT": FontAwesomeIcons.store,
  "OTHER": FontAwesomeIcons.question,
};