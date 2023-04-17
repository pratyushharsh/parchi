part of 'table_reservation_bloc.dart';

abstract class TableReservationEvent {}

class FetchAllTables extends TableReservationEvent {}

class ChangeReservationTime extends TableReservationEvent {
  final TimeOfDay time;

  ChangeReservationTime(this.time);
}

class ChangeReservationDate extends TableReservationEvent {
  final DateTime date;

  ChangeReservationDate(this.date);
}

class ChangeNumberOfGuest extends TableReservationEvent {
  final int numberOfGuest;

  ChangeNumberOfGuest(this.numberOfGuest);
}

class ChangeCustomerNotes extends TableReservationEvent {
  final String notes;

  ChangeCustomerNotes(this.notes);
}

class ChangeSelectedTable extends TableReservationEvent {
  final TableEntity table;

  ChangeSelectedTable(this.table);
}

class ChangeCustomerName extends TableReservationEvent {
  final String name;

  ChangeCustomerName(this.name);
}

class ChangeCustomerPhone extends TableReservationEvent {
  final String phone;

  ChangeCustomerPhone(this.phone);
}

class ChangeCustomer extends TableReservationEvent {
  final ContactEntity customer;

  ChangeCustomer(this.customer);
}

class CreateNewTableReservation extends TableReservationEvent {}