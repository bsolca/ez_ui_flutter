// ez_sidebar_header.dart
import 'package:flutter/material.dart';
import 'package:impostor/src/shared/ez_divider/ez_divider.dart';
import 'package:impostor/src/shared/ez_icon/hero_icon_icons.dart';
import 'package:impostor/src/shared/ez_item/ez_sidebar_item.dart';
import 'package:impostor/src/shared/ez_popover/ez_popover.dart';
import 'package:impostor/src/shared/ez_sidebar/ez_sidebar_consts.dart';
import 'package:impostor/src/shared/ez_sidebar/model/ez_sidebar_header_data.codegen.dart';
import 'package:impostor/src/shared/ez_sidebar/model/ez_sidebar_popover_item_data.codegen.dart';
import 'package:impostor/src/shared/squircle/squircle.dart';

/// A [EzSidebarHeader] widget that displays the header section of the sidebar.
///
/// This widget uses [EzSidebarHeaderData] to display the app name and logo.
class EzSidebarHeader extends StatelessWidget {
  /// Factory constructor that creates [EzSidebarHeaderData] from parameters.
  factory EzSidebarHeader({
    Key? key,
    required String appName,
    required VoidCallback onTap,
    required String? avatarUrl,
    required List<EzSidebarPopoverItemData> items,
  }) {
    return EzSidebarHeader._(
      key: key,
      data: EzSidebarHeaderData(
        appName: appName,
        onTap: onTap,
        avatarUrl: avatarUrl,
        items: items,
      ),
    );
  }

  /// Creates a [EzSidebarHeader] widget.
  const EzSidebarHeader._({
    super.key,
    required EzSidebarHeaderData data,
  }) : _data = data;

  /// The data used to populate the header.
  final EzSidebarHeaderData _data;

  @override
  Widget build(BuildContext context) {
    final imgUrl = _data.avatarUrl;
    final appName = _data.appName;
    final colorScheme = Theme.of(context).colorScheme;

    Widget avatarWidget;
    if (imgUrl != null) {
      avatarWidget = ClipOval(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: colorScheme.primary,
              width: EzSidebarConsts.itemBorderSmoothing,
            ),
            shape: BoxShape.circle,
          ),
          child: Image.network(
            imgUrl,
            width: EzSidebarConsts.avatarSize,
            height: EzSidebarConsts.avatarSize,
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      avatarWidget = ClipOval(
        child: Container(
          width: EzSidebarConsts.avatarSize,
          height: EzSidebarConsts.avatarSize,
          color: colorScheme.primary,
          child: Center(
            child: Icon(
              Icons.apps,
              color: colorScheme.onPrimary,
              size: EzSidebarConsts.avatarSize / 2,
            ),
          ),
        ),
      );
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
              controller: menuController,
              offset: EzSidebarConsts.popoverOffset,
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
              child: Padding(
                padding: EzSidebarConsts.footerPadding,
                child: Row(
                  children: [
                    avatarWidget,
                    SizedBox(
                      width: EzSidebarConsts.horizontalPadding.horizontal / 2,
                    ),
                    Expanded(
                      child: Text(
                        appName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Icon(
                      HeroIcon.chevronDown,
                      color: colorScheme.primary,
                      size: EzSidebarConsts.sidebarItemIconSize,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

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
}
