import 'package:flutter/cupertino.dart';

import 'invoice_builder.dart';

class CustomExpanded extends ParentDataWidget<CustomInvoiceColumnParentData> {
  final int flex;
  const CustomExpanded({Key? key, required Widget child, this.flex = 1})
      : assert(flex > 0),
        super(key: key, child: child);

  @override
  void applyParentData(RenderObject renderObject) {
    assert(renderObject.parentData is CustomInvoiceColumnParentData);
    final CustomInvoiceColumnParentData parentData =
        renderObject.parentData! as CustomInvoiceColumnParentData;

    if (parentData.flex != flex) {
      parentData.flex = flex;

      final targetObject = renderObject.parent;
      if (targetObject is RenderObject) {
        targetObject.markNeedsLayout();
      }
    }
  }

  @override
  Type get debugTypicalAncestorWidgetClass => CustomExpanded;
}
