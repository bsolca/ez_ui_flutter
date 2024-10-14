import 'package:flutter/material.dart';
import 'package:impostor/src/shared/ez_divider/ez_divider_const.dart';

/// Divider used between sidebar items in the layout or the popover.
class EzDivider extends StatelessWidget {
  /// Divider used between sidebar items in the layout or the popover.
  const EzDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EzDividerConsts.horizontalPadding,
      child: Divider(
        thickness: EzDividerConsts.dividerThickness,
        color: EzDividerConsts.getDividerColor(colorScheme),
      ),
    );
  }
}
