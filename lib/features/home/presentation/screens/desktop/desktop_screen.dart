import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pyraspace/core/constant/constant_app_colors.dart';
import 'package:pyraspace/core/constant/constant_asset_path.dart';
import 'package:pyraspace/features/home/presentation/provider/theme_provider.dart';
import 'package:pyraspace/features/home/presentation/screens/desktop/extension/hover_extension.dart';
import 'package:pyraspace/features/home/presentation/screens/desktop/widgets/animated_navigation_button_widget.dart';
import 'package:pyraspace/features/home/presentation/screens/desktop/widgets/authentication_button_widget.dart';
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
    // Retrieve the current user-preferred theme from the provider
    final bool userPreparedTheme =
        ref.watch<bool>(userPreparedThemeStateProvider);

    // Create hover state providers for each navigation button
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
                // Display the logo based on the user's preferred theme
                Image.asset(
                  userPreparedTheme
                      ? AssetPath.darkPngLogo
                      : AssetPath.lightPngLogo,
                  height: 40,
                ).withHover, // Apply hover functionality to the logo

                Padding(
                  padding: const EdgeInsets.only(left: 85),
                  child: Row(
                    children: [
                      // Navigation buttons with hover functionality
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

                // Authentication buttons (Login and Register)
                Row(
                  children: [
                    AuthenticationButtonWidget(
                      label: 'Login',
                      onTap: () {},
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    AuthenticationButtonWidget(
                      isFilled: true,
                      label: 'Register',
                      onTap: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: SizedBox(
                        width: 500,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                // Horizontal line for decorative purpose
                                Container(
                                  width: 40,
                                  height: 2,
                                  decoration: BoxDecoration(
                                    color: userPreparedTheme
                                        ? LightThemeColors.secondaryTextColor
                                        : DarkThemeColors.secondaryTextColor,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),

                                // Application title
                                Text(
                                  'Office Space',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: userPreparedTheme
                                        ? LightThemeColors.secondaryTextColor
                                        : DarkThemeColors.secondaryTextColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            // Main headline
                            Text(
                              'The New',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w600,
                                color: userPreparedTheme
                                    ? LightThemeColors.primaryTextColor
                                    : DarkThemeColors.primaryTextColor,
                              ),
                            ),
                            Text(
                              'Way To Discover',
                              style: TextStyle(
                                height: 0.5,
                                fontSize: 40,
                                fontWeight: FontWeight.w600,
                                color: userPreparedTheme
                                    ? LightThemeColors.primaryTextColor
                                    : DarkThemeColors.primaryTextColor,
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),

                            // Subtitle
                            Text(
                              'Meeting Place, Work Place, Office Space And More.',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: userPreparedTheme
                                    ? LightThemeColors.secondaryTextColor
                                    : DarkThemeColors.secondaryTextColor,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            // Book Now & About Us button
                            Row(
                              children: [
                                AuthenticationButtonWidget(
                                  isFilled: true,
                                  label: 'Book Now',
                                  onTap: () {},
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                AuthenticationButtonWidget(
                                  label: 'About Us',
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // Buildings image
                Expanded(
                  child: Column(
                    children: [
                      Flexible(
                        child: Center(
                          child: Image.asset(
                            userPreparedTheme
                                ? AssetPath.lightBuildings
                                : AssetPath.darkBuildings,
                            width: 500,
                          ),
                        ),
                      ),

                      // Theme toggler button
                      const Align(
                        alignment: Alignment.bottomRight,
                        child: ToggleThemeIconButtonWidget(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
