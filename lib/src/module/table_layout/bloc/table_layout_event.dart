part of 'table_layout_bloc.dart';

abstract class TableLayoutEvent {}

class FetchAllTables extends TableLayoutEvent {}

class RefreshReservation extends TableLayoutEvent {}

class FetchTablesByFloor extends TableLayoutEvent {
  final FloorEntity floor;
  FetchTablesByFloor({required this.floor});
}

class ConfirmReservation extends TableLayoutEvent {
  final TableReservationEntity reservation;
  ConfirmReservation({required this.reservation});
}

class CompleteReservation extends TableLayoutEvent {
  final TableReservationEntity reservation;
  CompleteReservation({required this.reservation});
}