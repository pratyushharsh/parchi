import 'package:flutter/material.dart';

import '../../entity/pos/floor_entity.dart';
import '../../entity/pos/table_entity.dart';
import 'table_layout_view.dart';

typedef OnLayoutSaveCallback = void Function(List<TableEntity>);

class TableLayoutDesigner extends StatelessWidget {
  final bool isEditable;
  final List<TableEntity> tables;
  final FloorEntity floor;
  final OnLayoutSaveCallback? onSave;
  const TableLayoutDesigner(
      {Key? key,
      required this.tables,
      required this.floor,
      this.isEditable = true,
      this.onSave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutCanvas(
      height: floor.height,
      width: floor.width,
      tables: tables,
      isEditable: isEditable,
      onPressed: onSave,
    );
  }
}

class LayoutCanvas extends StatefulWidget {
  final double height;
  final double width;
  final List<TableEntity> tables;
  final bool isEditable;
  final OnLayoutSaveCallback? onPressed;
  const LayoutCanvas(
      {Key? key,
      required this.height,
      required this.width,
      required this.tables,
      required this.isEditable,
      this.onPressed})
      : super(key: key);

  @override
  State<LayoutCanvas> createState() => _LayoutCanvasState();
}

class _LayoutCanvasState extends State<LayoutCanvas> {
  Map<TableEntity, Pair> tablePosition = {};

  @override
  void initState() {
    super.initState();
    for (var table in widget.tables) {
      tablePosition[table] = Pair(table.x, table.y);
    }
  }

  void updateTablePosition(TableEntity table, Pair position) {
    setState(() {
      tablePosition[table] = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    int boxHeight = 20;
    int boxWidth = 20;
    int numberOfColumns = widget.height ~/ boxHeight;
    int numberOfRows = widget.width ~/ boxWidth;

    return Container(
      constraints: BoxConstraints(
        minWidth: widget.width,
        minHeight: widget.height,
        maxHeight: widget.height,
        maxWidth: widget.width,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SingleChildScrollView(
              child: Stack(
                children: [
                  DragTarget(
                    builder: (BuildContext context, List<Object?> candidateData, List<dynamic> rejectedData) {
                      return Canvas(
                        height: widget.height,
                        width: widget.width,
                      );
                    },
                    onAcceptWithDetails: (details) {

                      RenderBox? renderBox = context.findRenderObject() as RenderBox?;
                      Offset offset = renderBox!.globalToLocal(details.offset);

                      if (details.data is TableEntity) {
                        TableEntity table = details.data as TableEntity;
                        updateTablePosition(table, Pair(offset.dx, offset.dy));
                      }
                    },
                  ),
                  ...tablePosition.entries
                      .map(
                        (e) => Positioned(
                          left: e.value.x,
                          top: e.value.y,
                          child: widget.isEditable ? Draggable(
                            feedback: TableIcon(
                              table: e.key,
                            ),
                            childWhenDragging: Container(),
                            data: e.key,
                            child: TableIcon(
                              table: e.key,
                              canEdit: true,
                            ),
                          ) : TableIcon(
                            table: e.key,
                          )
                        ),
                      )
                      .toList(),
                  if (widget.isEditable)
                  Positioned(top: 20, left: 10,child: IconButton(onPressed: () {
                    tablePosition.forEach((key, value) {
                      key.x = value.x;
                      key.y = value.y;
                    });
                    if (widget.onPressed != null) {
                      widget.onPressed!(tablePosition.keys.toList());
                    }
                  }, icon: const Icon(Icons.save)),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Pair {
  final double x;
  final double y;
  const Pair(this.x, this.y);
}

class Canvas extends StatelessWidget {
  final double height;
  final double width;
  const Canvas({Key? key, required this.height, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: height,
      height: width,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
        ),
      ),
    );
  }
}
