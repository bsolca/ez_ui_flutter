import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:impostor/src/features/sidebar/sidebar_item_brightness.dart';
import 'package:impostor/src/features/sidebar/sidebar_item_language.dart';
import 'package:impostor/src/shared/ez_icon/hero_icon_icons.dart';
import 'package:impostor/src/shared/ez_sidebar/model/ez_sidebar_footer_data.codegen.dart';
import 'package:impostor/src/shared/ez_sidebar/model/ez_sidebar_header_data.codegen.dart';
import 'package:impostor/src/shared/ez_sidebar/model/ez_sidebar_item_data.codegen.dart';
import 'package:impostor/src/shared/ez_sidebar/model/ez_sidebar_popover_item_data.codegen.dart';
import 'package:impostor/src/shared/ez_sidebar_layout/ez_sidebar_layout.dart';
import 'package:impostor/src/utils/extension/widget_ref_extension.dart';
import 'package:impostor/src/utils/routing/go_router_provider.codegen.dart';

/// Sidebar widget of the dashboard app.
@immutable
class Sidebar extends ConsumerWidget {
  /// Creates the sidebar widget of the dashboard app.
  const Sidebar({super.key, required this.child});

  /// Content of the sidebar.
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return EzSidebarLayout(
      // key: sidebarKey, // Removed
      headerData: EzSidebarHeaderData(
        appName: 'Ez Dashboard',
        onTap: () => print('Header Tapped'),
        avatarUrl: null,
        items: [
          EzSidebarPopoverItemData.regular(
            text: 'Settings',
            icon: HeroIcon.cog8Tooth,
            onTap: () => print('Settings Tapped'),
          ),
        ],
      ),
      footerData: EzSidebarFooterData(
        name: 'Benjamin Sx',
        email: 'benjamin@ez.io',
        onTap: () => print('Footer Tapped'),
        avatarUrl: null,
        items: [
          EzSidebarPopoverItemData.regular(
            text: 'Settings',
            icon: HeroIcon.cog8Tooth,
            onTap: () => print('Settings Tapped'),
          ),
          EzSidebarPopoverItemData.regular(
            text: 'Settings',
            icon: HeroIcon.cog8Tooth,
            onTap: () => print('Settings Tapped'),
          ),
          const EzSidebarPopoverItemData.separator(),
          EzSidebarPopoverItemData.regular(
            text: 'Settings',
            icon: HeroIcon.cog8Tooth,
            onTap: () => print('Settings Tapped'),
          ),
          EzSidebarPopoverItemData.regular(
            text: 'Settings',
            icon: HeroIcon.cog8Tooth,
            onTap: () => print('Settings Tapped'),
          ),
          EzSidebarPopoverItemData.regular(
            text: 'Settings',
            icon: HeroIcon.cog8Tooth,
            onTap: () => print('Settings Tapped'),
          ),
        ],
      ),
      items: [
        // Make items const if possible
        EzSidebarItemData.regular(
          text: ref.loc.home,
          icon: HeroIcon.home,
          onTap: () => context.go('/'),
        ),
        EzSidebarItemData.regular(
          text: ref.loc.settingScreenSettings,
          icon: HeroIcon.adjustmentsHorizontal,
          onTap: () => context.goNamed(AppRoute.settingsUserProfile.name),
        ),
        EzSidebarItemData.regular(
          text: ref.loc.profile,
          icon: HeroIcon.userCircle,
          onTap: () => context.goNamed(AppRoute.settingsUserProfile.name),
        ),
        // Add heading
        EzSidebarItemData.heading(text: ref.loc.users),
        EzSidebarItemData.regular(
          text: ref.loc.users,
          icon: HeroIcon.users,
          onTap: () => context.goNamed(AppRoute.usersUsers.name),
        ),
        // add groups
        EzSidebarItemData.regular(
          text: ref.loc.groups,
          icon: HeroIcon.userGroup,
          onTap: () => context.goNamed(AppRoute.usersGroups.name),
        ),
        const EzSidebarItemData.heading(text: 'Tools'),
        EzSidebarItemData.regular(
          text: 'Color Scheme Preview',
          icon: HeroIcon.userGroup,
          onTap: () => context.goNamed(AppRoute.colorSchemePreview.name),
        ),
        SidebarItemLanguage.build(ref, context),
        SidebarItemBrightness.build(ref, context),
      ],
      content: child,
    );
  }
}
