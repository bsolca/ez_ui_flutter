import 'package:flutter/material.dart';
import 'package:impostor/src/shared/ez_item/ez_sidebar_item.dart';
import 'package:impostor/src/shared/ez_sidebar/ez_sidebar_consts.dart';

/// A widget that displays a footer item in the sidebar.
class EzSidebarFooterItem extends StatelessWidget {
  /// Creates a footer item in the sidebar.
  const EzSidebarFooterItem({
    super.key,
    required this.text,
    required this.icon,
    required this.svgPath,
    required this.onTap,
  });

  /// The text to display in the footer item.
  final String text;

  /// The icon to display in the footer item.
  final IconData? icon;

  /// The callback to be called when the footer item is tapped.
  final VoidCallback onTap;

  /// Path to the SVg icon
  final String? svgPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EzSidebarConsts.horizontalPadding,
      child: EzItem(
        text: text,
        icon: icon,
        svgPath: svgPath,
        isSelected: false, // Footer items cannot be selected
        onTap: onTap,
      ),
    );
  }
}
