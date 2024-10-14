// ignore_for_file: public_member_api_docs

// ez_sidebar_consts.dart
import 'package:flutter/material.dart';
import 'package:impostor/src/shared/squircle/squircle.dart';
import 'package:impostor/src/utils/constants/const_layout.dart';
import 'package:impostor/src/utils/constants/const_value.dart';

/// Constants and utility methods used in the Sidebar widget.
class EzSidebarConsts {
  EzSidebarConsts._();

  // ***************
  // Global Sidebar Constants
  // ***************

  /// Global settings for the sidebar widget
  static const double sidebarWidth = 260;
  static const double popoverWidth = sidebarWidth - ConstValue.dp16;
  static const Offset popoverOffset = Offset(0, ConstValue.dp4);
  static const Duration animationDuration = Duration(milliseconds: 200);

  // ************
  // Colors
  // ************

  static Color getPopoverColor(ColorScheme colorScheme) {
    return colorScheme.secondaryContainer;
  }

  static Color getPopoverBorderColor(ColorScheme colorScheme) {
    return ConstLayout.getMainBorderColor(colorScheme).withOpacity(0.95);
  }

  static Color getSidebarBackgroundColor(ColorScheme colorScheme) {
    return ConstLayout.getSecondaryBackgroundColor(colorScheme);
  }

  static Color getIndicatorColor(ColorScheme colorScheme) {
    return colorScheme.onSurface;
  }

  static Color getSidebarItemOverlayColor(ColorScheme colorScheme) {
    return colorScheme.inverseSurface.withAlpha(_itemOverlayOpacity);
  }

  static Color getSidebarItemIconHoverColor(ColorScheme colorScheme) {
    return colorScheme.onSurface;
  }

  static Color getSidebarItemIconDefaultColor(ColorScheme colorScheme) {
    return colorScheme.onSurface.withOpacity(0.6);
  }

  static Color getSidebarItemIconSelectedColor(ColorScheme colorScheme) {
    return colorScheme.onSurface;
  }

  // ************
  // Padding and Margins
  // ************

  static const EdgeInsets sidebarPadding = EdgeInsets.symmetric(
    vertical: 8,
  );

  static const EdgeInsets horizontalPadding = EdgeInsets.symmetric(
    horizontal: ConstValue.dp8,
  );

  static const EdgeInsets contentPadding = EdgeInsets.symmetric(
    horizontal: ConstValue.dp16,
    vertical: ConstValue.dp8,
  );

  static const EdgeInsets headerPadding = EdgeInsets.all(ConstValue.dp16);
  static const EdgeInsets footerPadding = EdgeInsets.all(ConstValue.dp8);

  static const EdgeInsets indicatorVerticalPadding = EdgeInsets.symmetric(
    vertical: ConstValue.dp8,
  );

  // ************
  // Divider
  // ************

  static const double dividerThickness = ConstValue.dp1;

  // ************
  // Sidebar Item
  // ************

  static const double itemBorderRadius = ConstValue.dp8;
  static const double itemBorderSmoothing = 0.4;
  static const int _itemOverlayOpacity = 20;
  static const double sidebarItemIconSize = ConstValue.dp24;
  static const BlendMode sidebarItemIconBlendMode = BlendMode.srcIn;

  static const TextStyle sidebarItemTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
  );

  static ShapeBorder getSidebarItemShapeBorder() {
    return SmoothRectangleBorder(
      borderRadius: SmoothBorderRadius(
        cornerRadius: itemBorderRadius,
        cornerSmoothing: itemBorderSmoothing,
      ),
    );
  }

  // ***************
  // Avatar
  // ***************

  static const double avatarSize = ConstValue.dp36;
}
