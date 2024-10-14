import 'package:flutter/material.dart';
import 'package:impostor/src/shared/ez_button/data/ez_button_enum.dart';
import 'package:impostor/src/shared/squircle/squircle.dart';
import 'package:impostor/src/utils/constants/const_layout.dart';
import 'package:impostor/src/utils/constants/const_value.dart';

/// A customizable button that extends [RawMaterialButton] for ease of use.
class EzButton extends StatelessWidget {
  /// Creates a [EzButton] with customizable properties.
  const EzButton({
    super.key,
    this.type = EzButtonType.regular,
    required this.onPressed,
    required this.text,
    this.prefixIcon,
    this.suffixIcon,
    this.textColor,
  });

  /// The callback that gets called when the button is pressed.
  final VoidCallback? onPressed;

  /// Text displayed on the button.
  final String text;

  /// Optional text color.
  final Color? textColor;

  /// Type of the button (private enum).
  final EzButtonType type;

  /// Prefix icon of the button.
  final IconData? prefixIcon;

  /// Suffix icon of the button.
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: _buildShape(context),
      padding: _getPadding(),
      hoverColor: _getHoverColor(context),
      splashColor: Colors.transparent,
      fillColor: _getFillColor(context),
      focusElevation: 0,
      hoverElevation: 0,
      highlightElevation: 0,
      elevation: 0,
      visualDensity: VisualDensity.comfortable,
      highlightColor: Colors.transparent,
      mouseCursor: _getMouseCursor(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (prefixIcon != null) Icon(prefixIcon),
          Text(
            text,
            style: _getTextStyle(context),
          ),
          if (suffixIcon != null) Icon(suffixIcon),
        ],
      ),
    );
  }

  SmoothRectangleBorder _buildShape(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SmoothRectangleBorder(
      side: _getBorderSide(colorScheme),
      borderRadius: SmoothBorderRadius(
        cornerRadius: ConstLayout.borderRadiusSmall,
        cornerSmoothing: ConstLayout.cornerSmoothing,
      ),
    );
  }

  BorderSide _getBorderSide(ColorScheme colorScheme) {
    switch (type) {
      case EzButtonType.outlined:
        return BorderSide(
          color: colorScheme.outline.withOpacity(0.2),
        );
      case EzButtonType.link:
        return BorderSide.none;
      case EzButtonType.regular:
        return BorderSide.none;
    }
  }

  EdgeInsets _getPadding() {
    return const EdgeInsets.symmetric(
      vertical: ConstValue.dp8,
      horizontal: ConstValue.dp16,
    );
  }

  Color _getHoverColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    switch (type) {
      case EzButtonType.link:
        return colorScheme.secondaryContainer;
      case EzButtonType.outlined:
        return colorScheme.surfaceContainerLow;
      case EzButtonType.regular:
        return colorScheme.onSurface;
    }
  }

  Color _getFillColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    switch (type) {
      case EzButtonType.link:
      case EzButtonType.outlined:
        return Colors.transparent;
      case EzButtonType.regular:
        return colorScheme.onSurfaceVariant.withOpacity(
          onPressed == null ? 0.3 : 1,
        );
    }
  }

  MouseCursor _getMouseCursor() {
    return onPressed == null
        ? SystemMouseCursors.forbidden
        : SystemMouseCursors.click;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: textColor ?? _getDefaultTextColor(colorScheme),
      fontWeight: FontWeight.bold,
    );
  }

  Color _getDefaultTextColor(ColorScheme colorScheme) {
    switch (type) {
      case EzButtonType.link:
        return colorScheme.onSurfaceVariant;
      case EzButtonType.outlined:
        return colorScheme.onSurface.withOpacity(onPressed == null ? 0.3 : 1);
      case EzButtonType.regular:
        return colorScheme.onInverseSurface;
    }
  }
}
