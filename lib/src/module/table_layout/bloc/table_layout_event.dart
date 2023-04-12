part of 'table_layout_bloc.dart';

abstract class TableLayoutEvent {}

class FetchAllTables extends TableLayoutEvent {}

class FetchTablesByFloor extends TableLayoutEvent {
  final FloorEntity floor;
  FetchTablesByFloor({required this.floor});
}