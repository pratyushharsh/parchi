import 'package:flutter/material.dart';

import '../../entity/pos/table_entity.dart';
import 'table_layout_view.dart';

class TableLayoutDesigner extends StatelessWidget {
  const TableLayoutDesigner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LayoutCanvas(
      height: 1500,
      width: 2000,
    );
  }
}

class LayoutCanvas extends StatefulWidget {
  final double height;
  final double width;
  const LayoutCanvas({Key? key, required this.height, required this.width}) : super(key: key);

  @override
  State<LayoutCanvas> createState() => _LayoutCanvasState();
}

class _LayoutCanvasState extends State<LayoutCanvas> {

  Map<String, Pair> tablePosition = {};

  @override
  void initState() {
    super.initState();
    tablePosition = {'1': const Pair(0, 0),};
  }

  void updateTablePosition(String tableId, Pair position) {
    setState(() {
      tablePosition[tableId] = position;
    });
  }


  @override
  Widget build(BuildContext context) {
    int boxHeight = 80;
    int boxWidth = 80;
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
                  Column(
                    children: [
                      for (var i = 0; i < numberOfColumns; i++)
                        Row(
                          children: [
                            for (var j = 0; j < numberOfRows; j++)
                              DragTarget(
                                builder: (BuildContext context, List<Object?> candidateData, List<dynamic> rejectedData) {
                                  return SizedBox(
                                    height: boxHeight * 1.0,
                                    width: boxWidth * 1.0,
                                    child: const Center(
                                      child: Icon(
                                        Icons.circle_rounded,
                                        size: 4,
                                        color: Colors.black,
                                      ),
                                    ),
                                  );
                                },
                                onWillAccept: (data) {
                                  return true;
                                },
                                onAccept: (data) {
                                  print('$data $i $j');
                                  updateTablePosition('1', Pair(j, i));
                                },
                              ),
                          ],
                        ),
                    ],
                  ),
                  ...tablePosition.entries.map((e) => Positioned(
                    left: 1.0 * e.value.x * boxWidth,
                    top: 1.0 * e.value.y * boxHeight,
                    child: Draggable(
                      feedback: TableIcon(
                        table: TableEntity(tableId: 'T1', tableCapacity: 4),
                      ),
                      childWhenDragging: const SizedBox(),
                      data: TableEntity(tableId: 'T1', tableCapacity: 4),
                      child: TableIcon(
                        table: TableEntity(tableId: 'T1', tableCapacity: 4),
                      ),
                    ),
                  ),).toList(),
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
  final int x;
  final int y;
  const Pair(this.x, this.y);
}