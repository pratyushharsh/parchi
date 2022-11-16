import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'get_position.dart';
import 'layout_overlay.dart';
import 'tooltip_widget.dart';

class KeypadOverlay extends StatefulWidget {
  final GlobalKey gKey;
  final Widget child;
  final Widget overlayWidget;
  final bool showOverlay;
  final EdgeInsets overlayPadding;

  const KeypadOverlay(
      {required this.gKey, required this.child, required this.overlayPadding, required this.showOverlay, required this.overlayWidget})
      : super(key: gKey);

  @override
  State<KeypadOverlay> createState() => _KeypadOverlayState();
}

class _KeypadOverlayState extends State<KeypadOverlay> {
  GetPosition? position;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    position ??= GetPosition(
      key: widget.gKey,
      padding: widget.overlayPadding,
      screenWidth: MediaQuery.of(context).size.width,
      screenHeight: MediaQuery.of(context).size.height,
    );
    showOverlay();
  }

  /// show overlay if there is any target widget
  ///
  void showOverlay() {}

  @override
  Widget build(BuildContext context) {
    return AnchoredOverlay(
      showOverlay: widget.showOverlay,
      child: widget.child,
      overlayBuilder: (context, rectBound, offset) {
        final size = MediaQuery.of(context).size;
        position = GetPosition(
          key: widget.gKey,
          padding: widget.overlayPadding,
          screenWidth: size.width,
          screenHeight: size.height,
        );
        // print('rectBound: $rectBound');
        // print('rectBound Size: ${rectBound.size}');
        // print('offset: $offset');
        // print('size: $size');
        return buildOverlayOnTarget(offset, rectBound.size, rectBound, size);
      },
    );
  }

  Widget buildOverlayOnTarget(
    Offset offset,
    Size size,
    Rect rectBound,
    Size screenSize,
  ) {
    var blur = 0.0;

    // Set blur to 0 if application is running on web and
    // provided blur is less than 0.
    blur = kIsWeb && blur < 0 ? 0 : blur;
    // print("Building Taget");
    return Stack(
      children: [
        KeypadWidget(showArrow: true, position: position, offset: offset, parentPosition: rectBound, child: widget.overlayWidget),
      ],
    );
  }
}
