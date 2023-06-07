import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pyraspace/core/constant/constant_app_colors.dart';
import 'package:pyraspace/features/home/presentation/provider/theme_provider.dart';
import 'package:pyraspace/features/home/presentation/screens/desktop/extension/hover_extension.dart';

/// A custom widget that represents an authentication button.
/// This button can be filled or unfilled and triggers a callback
/// when tapped.
class AuthenticationButtonWidget extends ConsumerWidget {
  /// Constructs an [AuthenticationButtonWidget].
  ///
  /// [isFilled] determines whether the button should be filled or unfilled.
  /// The default value is false (unfilled).
  ///
  /// [label] is the text to display on the button.
  ///
  /// [onTap] is the callback function that will be triggered when the button is tapped.
  const AuthenticationButtonWidget({
    Key? key,
    this.isFilled = false,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  /// Determines whether the button should be filled or unfilled.
  final bool isFilled;

  /// The text to display on the button.
  final String label;

  /// The callback function triggered when the button is tapped.
  final Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Retrieve the current state of the user-prepared theme.
    final bool userPreparedTheme =
        ref.watch<bool>(userPreparedThemeStateProvider);

    // Return the appropriate widget based on the isFilled property.
    return isFilled
        ? GestureDetector(
            onTap: onTap,
            child: Container(
              width: 100,
              color: userPreparedTheme
                  ? LightThemeColors.buttonColor
                  : DarkThemeColors.buttonColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Center(
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: userPreparedTheme
                          ? DarkThemeColors.primaryTextColor
                          : LightThemeColors.primaryTextColor,
                    ),
                  ),
                ),
              ),
            ).withHover,
          )
        : GestureDetector(
            onTap: onTap,
            child: Text(label).withHover,
          );
  }
}
