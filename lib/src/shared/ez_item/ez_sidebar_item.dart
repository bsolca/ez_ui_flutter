import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:impostor/src/shared/ez_item/ez_item_const.dart';
import 'package:impostor/src/shared/squircle/squircle.dart';
import 'package:impostor/src/utils/constants/const_layout.dart';

/// A [EzItem] widget that represents a single item in the sidebar.
///
/// This widget displays an optional icon, text, and indicates selection status.
/// It handles tap interactions to notify when the item is selected.
/// It also provides hover and splash effects for better user interaction.
class EzItem extends StatefulWidget {
  /// Creates a [EzItem] widget.
  ///
  /// The [text], [isSelected], and [onTap] parameters are required.
  /// The [icon] parameter is optional and can be used to display an icon.
  const EzItem({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    required this.icon,
    required this.svgPath,
  });

  /// The text label of the sidebar item.
  final String text;

  /// Whether the sidebar item is currently selected.
  final bool isSelected;

  /// Callback invoked when the sidebar item is tapped.
  final VoidCallback onTap;

  /// The path to the SVG icon asset.
  final IconData? icon;

  /// Svg asset path.
  final String? svgPath;

  @override
  State<EzItem> createState() => _EzItemState();
}

class _EzItemState extends State<EzItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final icon = widget.icon;
    final svgPath = widget.svgPath;

    // Determine the icon color based on hover and selection states
    Color iconColor;
    if (_isHovered) {
      iconColor = EzItemConsts.getSidebarItemIconHoverColor(colorScheme);
    } else if (widget.isSelected) {
      iconColor = EzItemConsts.getSidebarItemIconSelectedColor(colorScheme);
    } else {
      iconColor = EzItemConsts.getSidebarItemIconDefaultColor(colorScheme);
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: EzItemConsts.animationDuration,
        decoration: ShapeDecoration(
          shape: ConstLayout.getShapeBorder(),
        ),
        child: ClipSmoothRect(
          radius: const SmoothBorderRadius.all(
            SmoothRadius(
              cornerRadius: ConstLayout.itemBorderRadius,
              cornerSmoothing: ConstLayout.itemBorderSmoothing,
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: widget.onTap,
              splashFactory: NoSplash.splashFactory,
              overlayColor: WidgetStateProperty.all(
                EzItemConsts.getSidebarItemOverlayColor(colorScheme),
              ),
              child: Padding(
                padding: EzItemConsts.contentPadding,
                // Using contentPadding here
                child: Row(
                  children: [
                    if (svgPath != null)
                      Padding(
                        padding: EzItemConsts.itemIconPadding,
                        child: SvgPicture.asset(
                          svgPath,
                          width: EzItemConsts.sidebarItemIconSize,
                        ),
                      ),
                    if (icon != null)
                      Padding(
                        padding: EzItemConsts.itemIconPadding,
                        child: Icon(
                          icon,
                          color: iconColor,
                          size: EzItemConsts.sidebarItemIconSize,
                        ),
                      ),
                    Text(
                      widget.text,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: EzItemConsts.sidebarItemTextStyle,
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
}
