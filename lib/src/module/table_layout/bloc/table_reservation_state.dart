part of 'table_reservation_bloc.dart';

enum ReservationStatus { initial, loading, loaded, error, success }

class TableReservationState {
  final List<TableEntity> tables;
  final ReservationStatus status;
  final TableEntity? selectedTable;
  DateTime? reservationDate = DateTime.now();
  TimeOfDay? reservationTime = TimeOfDay.now();
  final int numberOfPeople;
  final String customerNotes;
  final ContactEntity? customer;
  final String customerName;
  final String customerPhone;

  bool get isValid {
    return customerName.isNotEmpty &&
        customerPhone.isNotEmpty &&
        reservationDate != null &&
        reservationTime != null;
  }

  TableReservationState(
      {this.tables = const [],
      this.status = ReservationStatus.initial,
      this.selectedTable,
      this.reservationDate,
      this.reservationTime,
      this.numberOfPeople = 1,
      this.customerNotes = '',
      this.customer,
      this.customerName = '',
      this.customerPhone = ''});

  TableReservationState copyWith(
      {List<TableEntity>? tables,
      ReservationStatus? status,
      TableEntity? selectedTable,
      DateTime? reservationDate,
        TimeOfDay? reservationTime,
      int? numberOfPeople, String? customerNotes,
      ContactEntity? customer,
      String? customerName,
      String? customerPhone}) {
    return TableReservationState(
        tables: tables ?? this.tables,
        status: status ?? this.status,
        reservationDate: reservationDate ?? this.reservationDate,
        reservationTime: reservationTime ?? this.reservationTime,
        numberOfPeople: numberOfPeople ?? this.numberOfPeople,
        selectedTable: selectedTable ?? this.selectedTable,
    customerNotes: customerNotes ?? this.customerNotes,
        customer: customer ?? this.customer,
        customerName: customerName ?? this.customerName,
        customerPhone: customerPhone ?? this.customerPhone);
  }
}
