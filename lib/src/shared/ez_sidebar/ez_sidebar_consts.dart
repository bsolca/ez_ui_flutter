// ignore_for_file: public_member_api_docs

import 'package:ez_fit_app/src/shared/ez_squircle/ez_squircle.dart';
import 'package:ez_fit_app/src/utils/constants/ez_const_color_getter.dart';
import 'package:ez_fit_app/src/utils/constants/ez_const_value.dart';

// ez_sidebar_consts.dart
import 'package:flutter/material.dart';

/// Constants and utility methods used in the Sidebar widget.
class EzSidebarConsts {
  EzSidebarConsts._();

  // ***************
  // Global Sidebar Constants
  // ***************

  /// Global settings for the sidebar widget
  static const double sidebarWidth = 260;
  static const double popoverWidth = sidebarWidth - EzConstValue.dp16;
  static const Offset popoverOffset = Offset(0, EzConstValue.dp4);
  static const Duration animationDuration = Duration(milliseconds: 200);

  // ************
  // Colors
  // ************

  static Color getPopoverColor(ColorScheme colorScheme) {
    return colorScheme.secondaryContainer;
  }

  static Color getPopoverBorderColor(ColorScheme colorScheme) {
    return EzConstsColorsGetter.getMainBorderColor(colorScheme).withOpacity(
      0.95,
    );
  }

  static Color getSidebarBackgroundColor(ColorScheme colorScheme) {
    return EzConstsColorsGetter.getSecondaryBackgroundColor(colorScheme);
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
    vertical: EzConstValue.dp8,
  );

  static const EdgeInsets horizontalPadding = EdgeInsets.symmetric(
    horizontal: EzConstValue.dp8,
  );

  static const EdgeInsets contentPadding = EdgeInsets.symmetric(
    horizontal: EzConstValue.dp16,
    vertical: EzConstValue.dp8,
  );

  static const EdgeInsets headerPadding = EdgeInsets.all(EzConstValue.dp16);
  static const EdgeInsets footerPadding = EdgeInsets.all(EzConstValue.dp8);

  static const EdgeInsets indicatorVerticalPadding = EdgeInsets.symmetric(
    vertical: EzConstValue.dp8,
  );

  // ************
  // Divider
  // ************

  static const double dividerThickness = EzConstValue.dp1;

  // ************
  // Sidebar Item
  // ************

  static const double itemBorderRadius = EzConstValue.dp8;
  static const double itemBorderSmoothing = 0.4;
  static const int _itemOverlayOpacity = 20;
  static const double sidebarItemIconSize = EzConstValue.dp24;
  static const BlendMode sidebarItemIconBlendMode = BlendMode.srcIn;

  static const TextStyle sidebarItemTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
  );

  static ShapeBorder getSidebarItemShapeBorder() {
    return EzSmoothRectangleBorder(
      borderRadius: EzSmoothBorderRadius(
        cornerRadius: itemBorderRadius,
        cornerSmoothing: itemBorderSmoothing,
      ),
    );
  }

  // ***************
  // Avatar
  // ***************

  static const double avatarSize = EzConstValue.dp36;
}
