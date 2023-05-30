import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pyraspace/config/theme.dart';
import 'package:pyraspace/core/layout/responsive_layout.dart';
import 'package:pyraspace/features/home/presentation/provider/theme_provider.dart';
import 'package:pyraspace/features/home/presentation/screens/desktop/desktop_screen.dart';
import 'package:pyraspace/features/home/presentation/screens/phone/phone_screen.dart';
import 'package:pyraspace/features/home/presentation/screens/tablet/tablet_screen.dart';

void main() {
  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  /// Initializes the user-prepared theme during the widget's initialization phase.
  ///
  /// It calls the [initializeUserTheme] function to retrieve the persisted theme preference from SharedPreferences
  /// and update the user-prepared theme state accordingly.
  /// The [ref] parameter is required to access the required providers for state management.
  ///
  /// This method should be called inside the [initState] method of a Stateful widget.
  /// It ensures that the user-prepared theme is properly initialized before the widget's build phase.
  @override
  void initState() {
    initializeUserTheme(ref: ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pyraspace.',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ref.watch(themeModeStateProvider),
      home: const ResponsiveLayout(
        phone: PhoneScreen(),
        tablet: TabletScreen(),
        desktop: DesktopScreen(),
      ),
    );
  }
}
