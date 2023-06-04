import 'package:flutter/material.dart';

/// A widget that displays different content depending on the screen size.
///
/// This widget takes three required arguments:
///
/// * phone: The widget that should be displayed on phones.
/// * tablet: The widget that should be displayed on tablets.
/// * desktop: The widget that should be displayed on desktops.
///
/// The ResponsiveLayout widget uses the LayoutBuilder widget to determine which widget to display based on the screen size. The LayoutBuilder widget takes a builder function that is called with two arguments: the BuildContext and the BoxConstraints of the LayoutBuilder. The builder function should return the widget that should be displayed for the given constraints.
///
/// In the ResponsiveLayout widget, the builder function checks the maxWidth property of the BoxConstraints object. If the maxWidth is less than or equal to 480, the phone widget is returned. If the maxWidth is greater than 480 and less than or equal to 768, the tablet widget is returned. Otherwise, the desktop widget is returned.
///
/// ## Example
///
/// The following example shows how to use the ResponsiveLayout widget to display a different layout on phones, tablets, and desktops:
///
///
///
/// ResponsiveLayout(
///   phone: Text('This is the phone layout.'),
///   tablet: Text('This is the tablet layout.'),
///   desktop: Text('This is the desktop layout.'),
/// ),
///
///
///
/// ## Community standards
///
/// When using the ResponsiveLayout widget, it is important to follow the following community standards:
///
/// * Use consistent naming conventions for your widgets.
/// * Use descriptive comments to document your code.
/// * Test your code thoroughly before using it in production.
///
/// By following these standards, you can help to ensure that your code is easy to understand and maintain.
class ResponsiveLayout extends StatelessWidget {
  /// The widget that should be displayed on phones.
  final Widget phone;

  /// The widget that should be displayed on tablets.
  final Widget tablet;

  /// The widget that should be displayed on desktops.
  final Widget desktop;

  const ResponsiveLayout({
    Key? key,
    required this.phone,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 480) {
          return phone;
        } else if (constraints.maxWidth >= 480 &&
            constraints.maxWidth <= 1080) {
          return tablet;
        } else {
          return desktop;
        }
      },
    );
  }
}
