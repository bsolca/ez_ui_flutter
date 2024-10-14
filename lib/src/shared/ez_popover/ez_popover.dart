import 'package:flutter/material.dart';
import 'package:impostor/src/shared/ez_popover/ez_popover_const.dart';

/// Represents a popover with a list of items.
class EzPopover extends StatelessWidget {
  /// Creates a popover.
  const EzPopover({
    super.key,
    required this.child,
    required this.controller,
    required this.items,
    required this.offset,
    this.width,
  });

  /// Widget to tap to open the popover.
  final Widget child;

  /// Controller of the popover.
  final MenuController controller;

  /// Items to display in the popover.
  final List<Widget> items;

  /// Offset of the popover.
  final Offset offset;

  /// Width of the popover.
  final double? width;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final width = this.width;
    return MenuAnchor(
      builder: (context, controller, _) {
        return child;
      },
      controller: controller,
      alignmentOffset: offset,
      style: MenuStyle(
        padding: WidgetStateProperty.all(
          EzPopoverConsts.allPadding,
        ),
        elevation: WidgetStateProperty.all(0),
        backgroundColor: WidgetStateProperty.all(
          colorScheme.surfaceContainer,
        ),
      ),
      menuChildren: [
        // MenuStyle.minWidth in MenuAnchor doesn't work, this is a workaround.
        SizedBox(
          width: width != null
              ? (width - EzPopoverConsts.allPadding.horizontal)
              : null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: items,
          ),
        ),
      ],
    );
  }
}
