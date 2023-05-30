import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool _isLightTheme = true;

/// Provider that holds the current theme mode based on the user-prepared theme.
/// If the user-prepared theme is `true`, the theme mode is set to Light.
/// If the user-prepared theme is `false`, the theme mode is set to Dark.
final themeModeStateProvider = StateProvider<ThemeMode>((ref) =>
    ref.watch(userPreparedThemeStateProvider)
        ? ThemeMode.light
        : ThemeMode.dark);

/// Provider that holds the user-prepared theme state.
/// If it is `true`, the user prepared theme is Light.
/// If it is `false`, the user prepared theme is Dark.
final userPreparedThemeStateProvider =
    StateProvider<bool>((ref) => _isLightTheme);

/// Initializes the user-prepared theme by retrieving the persisted theme preference from SharedPreferences.
/// If the preference is not found, it defaults to the Light theme.
/// This function should be called once during app initialization.
Future<void> initializeUserTheme({required WidgetRef ref}) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  bool isLightTheme = sharedPreferences.getBool('persistedUserTheme') ?? true;
  ref
      .read(userPreparedThemeStateProvider.notifier)
      .update((state) => isLightTheme);
}
