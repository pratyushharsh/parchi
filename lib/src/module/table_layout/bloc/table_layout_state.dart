part of 'table_layout_bloc.dart';

enum TableLayoutStatus { initial, loading, loaded, error }

class TableLayoutState {
  final FloorEntity? floor;
  final List<FloorEntity> floors;
  final List<TableEntity> tables;
  final List<TableReservationEntity> currentReservation;
  final List<TableReservationEntity> upcoming;
  final List<TableReservationEntity> waitingList;
  final TableLayoutStatus status;
  final bool isTableSelected;

  int get numberOfGuest {
    return currentReservation.fold(0, (previousValue, element) {
      return previousValue + (element.numberOfGuest ?? 0);
    });
  }

  TableLayoutState(
      {this.floor,
      this.floors = const [],
      this.tables = const [],
      this.currentReservation = const [],
      this.upcoming = const [],
      this.waitingList = const [],
      this.status = TableLayoutStatus.initial,
      this.isTableSelected = false});

  TableLayoutState copyWith({
    FloorEntity? floor,
    List<FloorEntity>? floors,
    List<TableEntity>? tables,
    List<TableReservationEntity>? currentReservation,
    List<TableReservationEntity>? upcoming,
    List<TableReservationEntity>? waitingList,
    TableLayoutStatus? status,
    bool? isTableSelected,
  }) {
    return TableLayoutState(
      tables: tables ?? this.tables,
      floor: floor ?? this.floor,
      floors: floors ?? this.floors,
      currentReservation: currentReservation ?? this.currentReservation,
      upcoming: upcoming ?? this.upcoming,
      waitingList: waitingList ?? this.waitingList,
      status: status ?? this.status,
      isTableSelected: isTableSelected ?? this.isTableSelected,
    );
  }
}
