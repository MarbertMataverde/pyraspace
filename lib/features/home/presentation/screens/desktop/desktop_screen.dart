import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pyraspace/features/home/presentation/provider/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DesktopScreen extends ConsumerWidget {
  const DesktopScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool userPreparedTheme = ref.watch(userPreparedThemeStateProvider);
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            userPreparedTheme
                ? 'assets/png/dark_logo.png'
                : 'assets/png/light_logo.png',
            height: 50,
          ),
          ElevatedButton.icon(
            onPressed: () async {
              final bool userPreparedTheme =
                  ref.read(userPreparedThemeStateProvider);
              final sharedPreferences = await SharedPreferences.getInstance();

              ref
                  .read(userPreparedThemeStateProvider.notifier)
                  .update((state) => !userPreparedTheme);

              // Presisting the theme
              await sharedPreferences.setBool(
                  'persistedUserTheme', !userPreparedTheme);
            },
            icon: Icon(
              userPreparedTheme ? Icons.dark_mode : Icons.light_mode,
            ),
            label: Text(
              userPreparedTheme ? 'Dark Theme' : 'Light Theme',
            ),
          ),
        ],
      ),
    );
  }
}
