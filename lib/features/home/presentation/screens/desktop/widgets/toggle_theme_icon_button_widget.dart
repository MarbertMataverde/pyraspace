import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pyraspace/core/constant/constant_app_colors.dart';
import 'package:pyraspace/features/home/presentation/provider/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A widget that displays a toggle button for changing the theme.
class ToggleThemeIconButtonWidget extends ConsumerWidget {
  /// Constructs a [ToggleThemeIconButtonWidget].
  const ToggleThemeIconButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Retrieves the user-preferred theme from the provider
    final bool userPreparedTheme = ref.watch(userPreparedThemeStateProvider);

    return IconButton(
      tooltip: 'Toggle Theme',
      onPressed: () async {
        final sharedPreferences = await SharedPreferences.getInstance();

        // Toggles the user-preferred theme state
        ref
            .read(userPreparedThemeStateProvider.notifier)
            .update((state) => !userPreparedTheme);

        // Persists the theme state in SharedPreferences
        await sharedPreferences.setBool(
            'persistedUserTheme', !userPreparedTheme);
      },
      icon: Icon(
        // Displays the appropriate icon based on the user-preferred theme
        userPreparedTheme ? Icons.dark_mode : Icons.light_mode,
        color: userPreparedTheme
            ? LightThemeColors.buttonColor
            : DarkThemeColors.buttonColor,
      ),
    );
  }
}
