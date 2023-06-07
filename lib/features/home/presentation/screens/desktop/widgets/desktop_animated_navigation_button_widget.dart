import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pyraspace/core/constant/constant_app_colors.dart';
import 'package:pyraspace/features/home/presentation/provider/theme_provider.dart';

/// A widget that represents an animated navigation button.
///
/// The [AnimatedNavigationButtonWidget] is used to display a button with animated hover effects.
/// It extends [ConsumerWidget] and utilizes [Flutter Riverpod] for state management.
class AnimatedNavigationButtonWidget extends ConsumerWidget {
  final String text;
  final VoidCallback onTap;
  final StateProvider<bool> buttonHoverStateProvider;

  /// Constructs an [AnimatedNavigationButtonWidget].
  ///
  /// The [text] parameter specifies the text to be displayed on the button.
  /// The [onTap] parameter is a callback function to be executed when the button is tapped.
  /// The [buttonHoverStateProvider] is a [StateProvider] that manages the hover state of the specific hovered button.
  const AnimatedNavigationButtonWidget({
    Key? key,
    required this.text,
    required this.onTap,
    required this.buttonHoverStateProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Retrieves the hover state of the button from the provider
    final bool isHovered = ref.watch(buttonHoverStateProvider);

    // Retrieves the user-preferred theme from the provider
    final bool currentUserPreparedTheme =
        ref.watch(userPreparedThemeStateProvider);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MouseRegion(
        cursor: isHovered ? SystemMouseCursors.click : SystemMouseCursors.basic,
        onEnter: (_) {
          // Updates the hover state to true when the mouse enters
          ref.read(buttonHoverStateProvider.notifier).update((state) => true);
        },
        onExit: (_) {
          // Updates the hover state to false when the mouse exits
          ref.read(buttonHoverStateProvider.notifier).update((state) => false);
        },
        child: GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                bottom: isHovered
                    ? BorderSide(
                        color: currentUserPreparedTheme
                            ? LightThemeColors.primaryTextColor
                            : DarkThemeColors.primaryTextColor,
                        width: 1.5,
                      )
                    : BorderSide.none,
              ),
            ),
            child: Text(
              text,
            ),
          ),
        ),
      ),
    );
  }
}
