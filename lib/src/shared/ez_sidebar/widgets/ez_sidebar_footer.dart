import 'dart:math';

import 'package:flutter/material.dart';
import 'package:impostor/src/shared/ez_divider/ez_divider.dart';
import 'package:impostor/src/shared/ez_icon/hero_icon_icons.dart';
import 'package:impostor/src/shared/ez_item/ez_sidebar_item.dart';
import 'package:impostor/src/shared/ez_popover/ez_popover.dart';
import 'package:impostor/src/shared/ez_sidebar/ez_sidebar_consts.dart';
import 'package:impostor/src/shared/ez_sidebar/model/ez_sidebar_footer_data.codegen.dart';
import 'package:impostor/src/shared/ez_sidebar/model/ez_sidebar_popover_item_data.codegen.dart';
import 'package:impostor/src/shared/squircle/squircle.dart';
import 'package:impostor/src/utils/responsive/presentation/responsive_layout.dart';

/// Footer section of the sidebar.
///
/// The [EzSidebarFooter] displays the user's avatar, name, email, and a set of
/// items that can be accessed via a popover menu. The avatar can either be an
/// image or initials derived from the user's name.
class EzSidebarFooter extends StatelessWidget {
  /// Footer section of the sidebar.
  factory EzSidebarFooter({
    Key? key,
    required String name,
    required String email,
    required VoidCallback onTap,
    required String? avatarUrl,
    required List<EzSidebarPopoverItemData> items,
  }) {
    return EzSidebarFooter._(
      key: key,
      data: EzSidebarFooterData(
        name: name,
        email: email,
        onTap: onTap,
        avatarUrl: avatarUrl,
        items: items,
      ),
    );
  }

  /// Private constructor used to initialize the [EzSidebarFooter] with data.
  const EzSidebarFooter._({
    super.key,
    required EzSidebarFooterData data,
  }) : _data = data;

  /// The data used to populate the footer.
  final EzSidebarFooterData _data;

  @override
  Widget build(BuildContext context) {
    final imgUrl = _data.avatarUrl;
    final name = _data.name;
    final colorScheme = Theme.of(context).colorScheme;

    Widget avatarWidget;
    if (imgUrl != null) {
      avatarWidget = _buildClipSmoothRect(
        child: Image.network(
          imgUrl,
          width: EzSidebarConsts.avatarSize,
          height: EzSidebarConsts.avatarSize,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return _buildFallbackAvatar(context, name);
          },
        ),
      );
    } else {
      avatarWidget = _buildFallbackAvatar(context, name);
    }

    final menuController = MenuController();

    return Padding(
      padding: EzSidebarConsts.horizontalPadding,
      child: _buildClipSmoothRect(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashFactory: NoSplash.splashFactory,
            onTap: () {
              _data.onTap();
              if (menuController.isOpen) {
                menuController.close();
              } else {
                menuController.open();
              }
            },
            overlayColor: WidgetStateProperty.all(
              EzSidebarConsts.getSidebarItemOverlayColor(colorScheme),
            ),
            child: EzPopover(
              width: EzSidebarConsts.popoverWidth,
              items: _data.items.map((item) {
                if (item is EzRegularSidebarPopoverItemData) {
                  return EzItem(
                    text: item.text,
                    icon: item.icon,
                    svgPath: item.svgPath,
                    isSelected: false,
                    onTap: item.onTap,
                  );
                }
                return const EzDivider();
              }).toList(),
              controller: menuController,
              offset: EzSidebarConsts.popoverOffset,
              child: Padding(
                padding: EzSidebarConsts.footerPadding,
                child: ResponsiveLayout(
                  compact: (_, __) => avatarWidget,
                  medium: (_, __) {
                    return Row(
                      children: [
                        avatarWidget,
                        SizedBox(
                          width:
                              EzSidebarConsts.horizontalPadding.horizontal / 2,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _data.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                _data.email,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          HeroIcon.chevronUp,
                          color: colorScheme.primary,
                          size: EzSidebarConsts.sidebarItemIconSize,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Builds a rounded rectangle clip for the provided [child] widget.
  Widget _buildClipSmoothRect({required Widget child}) {
    return ClipSmoothRect(
      radius: const SmoothBorderRadius.all(
        SmoothRadius(
          cornerRadius: EzSidebarConsts.itemBorderRadius,
          cornerSmoothing: EzSidebarConsts.itemBorderSmoothing,
        ),
      ),
      child: child,
    );
  }

  /// 2 Letter initials avatar fallback.
  Widget _buildFallbackAvatar(BuildContext context, String name) {
    String getInitials(String name) {
      final nameParts = name.split(' ');
      if (nameParts.length == 1) {
        return nameParts[0]
            .substring(0, min(2, nameParts[0].length))
            .toUpperCase();
      } else {
        return nameParts.take(2).map((part) => part[0].toUpperCase()).join();
      }
    }

    return _buildClipSmoothRect(
      child: Container(
        width: EzSidebarConsts.avatarSize,
        height: EzSidebarConsts.avatarSize,
        color: Theme.of(context).colorScheme.primary,
        child: Center(
          child: Text(
            getInitials(name),
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: EzSidebarConsts.avatarSize / 2,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
