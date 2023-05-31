import 'package:flutter/material.dart';

/// An extension on the [Widget] class that adds hover functionality.
extension HoverExtension on Widget {
  /// Wraps the current widget with hover functionality.
  /// Changes the mouse cursor to [SystemMouseCursors.click] when the widget is hovered.
  Widget get withHover {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: this,
    );
  }
}
