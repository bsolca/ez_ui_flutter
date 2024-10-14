import 'package:flutter/material.dart';
import 'package:impostor/src/shared/ez_item/ez_sidebar_item.dart';
import 'package:impostor/src/shared/ez_sidebar/ez_sidebar_consts.dart';
import 'package:impostor/src/shared/ez_sidebar/model/ez_sidebar_item_data.codegen.dart';

/// Represents a regular item with a link in the sidebar.
class EzSidebarRegularItem extends StatelessWidget {
  /// Creates a item with a link in the sidebar.
  const EzSidebarRegularItem({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  /// The data of the item.
  final RegularSidebarItemData item;

  /// Whether the item is selected.
  final bool isSelected;

  /// Called when the item is tapped.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EzSidebarConsts.horizontalPadding,
      child: EzItem(
        text: item.text,
        icon: item.icon,
        svgPath: item.svgPath,
        isSelected: isSelected,
        onTap: onTap,
      ),
    );
  }
}
