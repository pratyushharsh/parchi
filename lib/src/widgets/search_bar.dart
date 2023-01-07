import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../config/theme_settings.dart';

class SearchBar extends StatefulWidget {
  final String label;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final Widget? filterWidget;
  const SearchBar(
      {Key? key,
      required this.label,
      this.onChanged,
      this.hintText,
      this.filterWidget})
      : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                cursorColor: AppColor.primary,
                decoration: InputDecoration(
                  isDense: true,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColor.primary,
                  ),
                  prefixIconConstraints:
                      const BoxConstraints(minHeight: 40, minWidth: 40),
                  contentPadding: const EdgeInsets.all(4),
                  focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.primary, width: 2)),
                  focusColor: AppColor.primary,
                  hoverColor: AppColor.primary,
                  hintText: widget.hintText?.tr(),
                ),
                onChanged: widget.onChanged,
              ),
            ),
          ],
        ),
        if (widget.filterWidget != null)
          const SizedBox(
            height: 4,
          ),
        if (widget.filterWidget != null) widget.filterWidget!,
      ],
    );
  }
}

class FilterList extends StatelessWidget {
  const FilterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: const [
              Text('Sort by'),
              Spacer(),
              Icon(Icons.close),
            ],
          ),
          Row(
            children: const [
              Text('Sort by'),
              Spacer(),
              Icon(Icons.close),
            ],
          ),
          Row(
            children: const [
              Text('Sort by'),
              Spacer(),
              Icon(Icons.close),
            ],
          ),
        ],
      ),
    );
  }
}

class FilterButton extends StatefulWidget {
  final Widget? child;
  final Widget? filterWidget;

  const FilterButton({Key? key, this.child, this.filterWidget})
      : super(key: key);

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  RelativeRect _position(RenderBox popupButtonObject, RenderBox overlay) {
    // Calculate the show-up area for the dropdown using button's size & position based on the `overlay` used as the coordinate space.

    return RelativeRect.fromSize(
      Rect.fromPoints(
        popupButtonObject.localToGlobal(
            popupButtonObject.size.bottomLeft(Offset.zero),
            ancestor: overlay),
        popupButtonObject.localToGlobal(
            popupButtonObject.size.bottomRight(Offset.zero),
            ancestor: overlay),
      ),
      Size(overlay.size.width, overlay.size.height),
    );
  }

  Future _openMenu() {
    // Here we get the render object of our physical button, later to get its size & position
    final popupButtonObject = context.findRenderObject() as RenderBox;
    // Get the render object of the overlay used in `Navigator` / `MaterialApp`, i.e. screen size reference
    var overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox;

    return showPopupMenu(
      context: context,
      position: _position(
        popupButtonObject,
        overlay,
      ),
      parentWidgetSize: popupButtonObject.size,
      child: const FilterList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _openMenu();
      },
      child: widget.child,
    );
  }
}

Future<T?> showPopupMenu<T>(
    {required BuildContext context,
    required Widget child,
    required RelativeRect position,
    required Size parentWidgetSize}) {
  final NavigatorState navigator = Navigator.of(context);
  return navigator.push(
    _FilterPopUpRoute<T>(
        context: context,
        child: child,
        position: position,
        capturedThemes: InheritedTheme.capture(
          from: context,
          to: navigator.context,
        ),
        parentWidgetSize: parentWidgetSize),
  );
}

class _FilterPopUpRouteLayout extends SingleChildLayoutDelegate {
  // Rectangle of underlying button, relative to the overlay's dimensions.
  final RelativeRect position;
  final BuildContext context;
  final Size parentWidgetSize;

  _FilterPopUpRouteLayout(
    this.context,
    this.position,
    this.parentWidgetSize,
  );

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    final parentRenderBox = context.findRenderObject() as RenderBox;
    //keyBoardHeight is height of keyboard if showing
    double keyBoardHeight = MediaQuery.of(context).viewInsets.bottom;
    double safeAreaTop = MediaQuery.of(context).padding.top;
    double safeAreaBottom = MediaQuery.of(context).padding.bottom;
    double totalSafeArea = safeAreaTop + safeAreaBottom;
    double maxHeight = constraints.minHeight - keyBoardHeight - totalSafeArea;
    return BoxConstraints.loose(
      Size(
        parentRenderBox.size.width,
        maxHeight,
      ),
    );
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    // size: The size of the overlay.
    // childSize: The size of the menu, when fully open, as determined by
    // getConstraintsForChild.

    //keyBoardHeight is height of keyboard if showing
    double keyBoardHeight = MediaQuery.of(context).viewInsets.bottom;

    // @TODO Use dynamic programming to find the best fir size for the widget based on the size of the screen
    double x = position.left + parentWidgetSize.width - childSize.width;

    // Find the ideal vertical position.
    double y = position.top + 6;
    // check if we are in the bottom
    if (y + childSize.height > size.height - keyBoardHeight) {
      y = size.height - childSize.height - keyBoardHeight;
    }

    return Offset(x, y);
  }

  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    return true;
  }
}

class _FilterPopUpRoute<T> extends PopupRoute<T> {
  final Widget child;
  final BuildContext context;
  final RelativeRect position;
  final CapturedThemes capturedThemes;
  final Size parentWidgetSize;

  _FilterPopUpRoute({
    required this.context,
    required this.child,
    required this.position,
    required this.capturedThemes,
    required this.parentWidgetSize,
  });

  @override
  Color? get barrierColor => Colors.transparent;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => 'Custom Barrier Label';

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final PopupMenuThemeData popupMenuTheme = PopupMenuTheme.of(context);
    final menu = Material(
      shape: popupMenuTheme.shape,
      color: popupMenuTheme.color,
      type: MaterialType.card,
      elevation: popupMenuTheme.elevation ?? 8.0,
      child: child,
    );

    return CustomSingleChildLayout(
      delegate: _FilterPopUpRouteLayout(context, position, parentWidgetSize),
      child: capturedThemes.wrap(menu),
    );
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);
}