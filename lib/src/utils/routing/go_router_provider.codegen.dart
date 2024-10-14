import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:impostor/src/features/color_scheme_preview/color_scheme_preview.dart';
import 'package:impostor/src/features/ez_scaffold_body/ez_scaffold_body.dart';
import 'package:impostor/src/features/user_settings/ui/user_settings_screen.dart';
import 'package:impostor/src/screens/home_screen/home_screen.dart';
import 'package:impostor/src/shared/app_scaffold/app_scaffold.dart';
import 'package:impostor/src/shared/ez_divider/ez_divider.dart';
import 'package:impostor/src/shared/ez_wrap_menu/data/ez_wrapper_tiem.dart';
import 'package:impostor/src/shared/ez_wrap_menu/ez_wrap_menu.dart';
import 'package:impostor/src/utils/log/logger.dart';
import 'package:impostor/src/utils/routing/data/location_provider.codegen.dart';
import 'package:impostor/src/utils/routing/presentation/go_route_page_scaffold.dart';
import 'package:impostor/src/utils/routing/presentation/not_found_screen.dart';
import 'package:impostor/src/utils/routing/presentation/unauthorized_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'go_router_provider.codegen.g.dart';

/// Routes for the app.
enum AppRoute {
  /// App entry point.
  home,

  /// Setting Profile of the logged in user.
  settingsUserProfile,

  /// Setting Notifications of the logged in user.
  settingsNotifications,

  /// Setting Preferences of the logged in user.
  settingsPreferences,

  /// Setting Plan and Billing of the logged in user.
  settingsPlanAndBilling,

  /// List of users.
  usersUsers,

  /// List of groups.
  usersGroups,

  /// Page showcasing color scheme colors.
  colorSchemePreview,

  /// Page for unauthorized access.
  unauthorized,
}

/// Provider for [GoRouter].
@riverpod
Raw<GoRouter> goRouter(GoRouterRef ref) {
  final rootNavigatorKey = GlobalKey<NavigatorState>();
  final shellNavigatorKey = GlobalKey<NavigatorState>();
  final shellSettingsKey = GlobalKey<NavigatorState>();

  final goRouter = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/',
    redirect: (context, state) async {
      return null;
    },
    routes: [
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        pageBuilder: (context, state, child) {
          // ShellRoute should ideally build the shell only once
          return NoTransitionPage(
            key: state.pageKey,
            child: AppScaffold(
              body: child,
            ),
          );
        },
        routes: [
          GoRoutePageScaffold(
            path: '/',
            name: AppRoute.home.name,
            parentNavigatorKey: shellNavigatorKey,
            body: const HomeScreen(),
          ),
          GoRoute(
            path: '/settings',
            redirect: (context, state) {
              if (state.fullPath == '/settings') {
                logError('Redirecting to /settings/profile');
                return '/settings/profile';
              }
              return null;
            },
            routes: [
              ShellRoute(
                navigatorKey: shellSettingsKey,
                pageBuilder: (ctx, state, child) {
                  // ShellRoute should ideally build the shell only once
                  return NoTransitionPage(
                    key: state.pageKey,
                    child: EzScaffoldBody(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Builder(
                              builder: (c) {
                                final ezWrapMenuItems = <EzWrapMenuItem>[
                                  EzWrapMenuItem(
                                    text: 'Profile',
                                    onPressed: () => c.goNamed(
                                      AppRoute.settingsUserProfile.name,
                                    ),
                                  ),
                                  EzWrapMenuItem(
                                    text: 'Notifications',
                                    onPressed: () => c.goNamed(
                                      AppRoute.settingsNotifications.name,
                                    ),
                                  ),
                                  EzWrapMenuItem(
                                    text: 'Preferences',
                                    onPressed: () => c.goNamed(
                                      AppRoute.settingsPreferences.name,
                                    ),
                                  ),
                                  EzWrapMenuItem(
                                    text: 'Plan & Billing',
                                    onPressed: () => c.goNamed(
                                      AppRoute.settingsPlanAndBilling.name,
                                    ),
                                  ),
                                ];

                                return EzWrapMenu(
                                  items: ezWrapMenuItems,
                                  initialSelectedItem: 0,
                                );
                              },
                            ),
                          ),
                          const EzDivider(),
                          Expanded(child: child),
                        ],
                      ),
                    ),
                  );
                },
                routes: [
                  GoRoutePageScaffold(
                    path: 'profile',
                    name: AppRoute.settingsUserProfile.name,
                    parentNavigatorKey: shellSettingsKey,
                    body: const UserSettingsScreen(),
                  ),
                  GoRoutePageScaffold(
                    path: 'notifications',
                    name: AppRoute.settingsNotifications.name,
                    parentNavigatorKey: shellSettingsKey,
                    body: const Center(child: Text('Settings Notifications')),
                  ),
                  GoRoutePageScaffold(
                    path: 'preferences',
                    name: AppRoute.settingsPreferences.name,
                    parentNavigatorKey: shellSettingsKey,
                    body: const Center(child: Text('Settings Preferences')),
                  ),
                  GoRoutePageScaffold(
                    path: 'plan_and_billing',
                    name: AppRoute.settingsPlanAndBilling.name,
                    parentNavigatorKey: shellSettingsKey,
                    body: const Center(child: Text('Settings Plan & Billing')),
                  ),
                ],
              ),
            ],
          ),
          GoRoutePageScaffold(
            path: '/users',
            name: AppRoute.usersUsers.name,
            parentNavigatorKey: shellNavigatorKey,
            body: const Center(child: Text('Users')),
          ),
          GoRoutePageScaffold(
            path: '/groups',
            name: AppRoute.usersGroups.name,
            parentNavigatorKey: shellNavigatorKey,
            body: const Center(child: Text('Groups')),
          ),
          // ColorSchemePreview
          GoRoutePageScaffold(
            path: '/color_scheme_preview',
            name: AppRoute.colorSchemePreview.name,
            parentNavigatorKey: shellNavigatorKey,
            body: const ColorSchemePreview(),
          ),
          GoRoutePageScaffold(
            path: '/unauthorized',
            name: AppRoute.unauthorized.name,
            parentNavigatorKey: shellNavigatorKey,
            body: const UnauthorizedScreen(),
          ),
        ],
      ),
    ],
    errorBuilder: (_, __) => const NotFoundScreen(),
  );

  goRouter.routerDelegate.addListener(() {
    final loc = goRouter.routerDelegate.currentConfiguration.uri.toString();
    ref.read(locationRepositoryProvider.notifier).set(loc);
    debugPrint('Location changed: $loc');
  });

  return goRouter;
}
