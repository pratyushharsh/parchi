import 'dart:math';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

typedef OnLineItemOverFlow = void Function(List<double> heights, double maxHeight);

// ignore: must_be_immutable
class CustomInvoiceColumn extends MultiChildRenderObjectWidget {
  final OnLineItemOverFlow onLineItemOverflow;
  CustomInvoiceColumn({Key? key, List<Widget> children = const [], required this.onLineItemOverflow})
      : super(key: key, children: children);

  List<double> _heights = [];
  double _maxHeight = 0.0;

  void setDetail(List<double> heights, double maxHeight) {
    _heights = heights;
    _maxHeight = maxHeight;
  }

  @override
  RenderObject createRenderObject(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onLineItemOverflow(_heights, _maxHeight);
    });
    return RenderCustomInvoiceColumn(this);
  }
}

class CustomInvoiceColumnParentData extends ContainerBoxParentData<RenderBox> {
  int? flex;
}

class RenderCustomInvoiceColumn extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, CustomInvoiceColumnParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox,
            CustomInvoiceColumnParentData> {

  final CustomInvoiceColumn customInvoiceColumn;

  RenderCustomInvoiceColumn(this.customInvoiceColumn);


  @override
  void setupParentData(RenderObject child) {
    if (child.parentData is! CustomInvoiceColumnParentData) {
      child.parentData = CustomInvoiceColumnParentData();
    }
  }

  @override
  void performLayout() {
    double width = 0, height = 0;
    RenderBox? child = firstChild;
    List<double> hs = [];

    RenderBox? lastFlexChild;

    int totalFlex = 0;
    while (child != null) {
      final childParentData = child.parentData as CustomInvoiceColumnParentData;
      final flex = childParentData.flex ?? 0;

      if (flex > 0) {
        totalFlex += flex;
        lastFlexChild = child;
      } else {
        child.layout(
            BoxConstraints(
              maxWidth: constraints.maxWidth,
            ),
            parentUsesSize: true);
            height += child.size.height;
            hs.add(child.size.height);
            width = max(child.size.width, width);
      }

      child = childParentData.nextSibling;
    }

    customInvoiceColumn.setDetail(hs, constraints.maxHeight);

    final flexHeight = constraints.maxHeight >= height ? (constraints.maxHeight - height) / totalFlex : 0.0;
    child = lastFlexChild;
    while (child != null) {
      final childParentData = child.parentData as CustomInvoiceColumnParentData;
      final flex = childParentData.flex ?? 0;

      if (flex > 0) {
        final childHeight = flex * flexHeight;
        child.layout(
            BoxConstraints(
                maxHeight: childHeight,
                minHeight: childHeight,
                maxWidth: constraints.maxWidth),
            parentUsesSize: true);
        height += childHeight;
        width = max(child.size.width, width);
      }

      child = childParentData.previousSibling;
    }

    child = firstChild;
    var childOffset = const Offset(0, 0);
    while (child != null) {
      final childParentData = child.parentData as CustomInvoiceColumnParentData;
      childParentData.offset = Offset(0, childOffset.dy);
      childOffset += Offset(0, child.size.height);

      child = childParentData.nextSibling;
    }

    size = Size(width, constraints.maxHeight);
  }


  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }
}
