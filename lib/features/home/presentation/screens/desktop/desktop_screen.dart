import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pyraspace/core/constant/constant_app_colors.dart';
import 'package:pyraspace/core/constant/constant_asset_path.dart';
import 'package:pyraspace/features/home/presentation/provider/theme_provider.dart';
import 'package:pyraspace/features/home/presentation/screens/desktop/extension/hover_extension.dart';
import 'package:pyraspace/features/home/presentation/screens/desktop/widgets/animated_navigation_button_widget.dart';
import 'package:pyraspace/features/home/presentation/screens/desktop/widgets/toggle_theme_icon_button_widget.dart';

/// A screen widget representing the desktop version of the application.
///
/// This widget displays the navigation bar and content for the desktop and web versions of the app.
/// It utilizes various other widgets to create the navigation bar, including buttons for different sections,
/// a logo, and login/register options.
///
/// The navigation bar consists of buttons for Home, Find, Book, and Contact sections.
/// Each button has hover functionality and triggers specific actions when tapped.
///
/// The logo displayed in the navigation bar changes based on the user's preferred theme.
///
/// The widget also includes a toggle button for changing the theme and login/register options.
/// The theme change is persisted based on the user's preference.
///
/// This screen widget provides a responsive layout for the desktop and web versions of the app,
/// offering an intuitive navigation experience.
class DesktopScreen extends ConsumerWidget {
  const DesktopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool userPreparedTheme = ref.watch(userPreparedThemeStateProvider);

    final homeHoverStateProvider = StateProvider<bool>((ref) => false);
    final findHoverStateProvider = StateProvider<bool>((ref) => false);
    final bookHoverStateProvider = StateProvider<bool>((ref) => false);
    final contactHoverStateProvider = StateProvider<bool>((ref) => false);

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  userPreparedTheme
                      ? AssetPath.darkPngLogo
                      : AssetPath.lightPngLogo,
                  height: 40,
                ).withHover,
                Padding(
                  padding: const EdgeInsets.only(left: 85),
                  child: Row(
                    children: [
                      AnimatedNavigationButtonWidget(
                        buttonHoverStateProvider: homeHoverStateProvider,
                        text: 'Home',
                        onTap: () {},
                      ),
                      AnimatedNavigationButtonWidget(
                        buttonHoverStateProvider: findHoverStateProvider,
                        text: 'Find',
                        onTap: () {},
                      ),
                      AnimatedNavigationButtonWidget(
                        buttonHoverStateProvider: bookHoverStateProvider,
                        text: 'Book',
                        onTap: () {},
                      ),
                      AnimatedNavigationButtonWidget(
                        buttonHoverStateProvider: contactHoverStateProvider,
                        text: 'Contact',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const Text('Login').withHover,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 100,
                        color: userPreparedTheme
                            ? LightThemeColors.buttonColor
                            : DarkThemeColors.buttonColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Center(
                            child: Text(
                              'Register',
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
                    ),
                  ],
                )
              ],
            ),
          ),
          const Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: ToggleThemeIconButtonWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
