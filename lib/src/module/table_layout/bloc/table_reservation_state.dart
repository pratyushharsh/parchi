part of 'table_reservation_bloc.dart';

enum TableReservationStatus { initial, loading, loaded, error }

class TableReservationState {
  final List<TableEntity> tables;
  final TableReservationStatus status;
  final TableEntity? selectedTable;
  DateTime? reservationDate = DateTime.now();
  TimeOfDay? reservationTime = TimeOfDay.now();
  final int numberOfPeople;
  final String customerNotes;
  final ContactEntity? customer;

  TableReservationState(
      {this.tables = const [],
      this.status = TableReservationStatus.initial,
      this.selectedTable,
      this.reservationDate,
      this.reservationTime,
      this.numberOfPeople = 1,
      this.customerNotes = '',
      this.customer});

  TableReservationState copyWith(
      {List<TableEntity>? tables,
      TableReservationStatus? status,
      TableEntity? selectedTable,
      DateTime? reservationDate,
        TimeOfDay? reservationTime,
      int? numberOfPeople, String? customerNotes,
      ContactEntity? customer}) {
    return TableReservationState(
        tables: tables ?? this.tables,
        status: status ?? this.status,
        reservationDate: reservationDate ?? this.reservationDate,
        reservationTime: reservationTime ?? this.reservationTime,
        numberOfPeople: numberOfPeople ?? this.numberOfPeople,
        selectedTable: selectedTable ?? this.selectedTable,
    customerNotes: customerNotes ?? this.customerNotes,
        customer: customer ?? this.customer);
  }
}
