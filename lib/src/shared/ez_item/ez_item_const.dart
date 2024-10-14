// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:impostor/src/utils/constants/const_value.dart';
import 'package:impostor/src/utils/constants/ez_const_color_getter.dart';

/// Constants and utility methods used in the EzItem widget.
class EzItemConsts {
  EzItemConsts._();

  // ***************
  // Global Sidebar Constants
  // ***************

  static const Duration animationDuration = ConstValue.animationDuration;

  // ************
  // Colors
  // ************

  static Color getSidebarItemOverlayColor(ColorScheme colorScheme) {
    return EzConstsColorsGetter.getDividerColor(colorScheme);
  }

  static Color getSidebarItemIconHoverColor(ColorScheme colorScheme) {
    return EzConstsColorsGetter.getHoverColor(colorScheme);
  }

  static Color getSidebarItemIconDefaultColor(ColorScheme colorScheme) {
    return colorScheme.onSurface.withOpacity(0.6);
  }

  static Color getSidebarItemIconSelectedColor(ColorScheme colorScheme) {
    return EzConstsColorsGetter.getItemSelectedColor(colorScheme);
  }

  // ************
  // Padding and Margins
  // ************

  static const EdgeInsets contentPadding = EdgeInsets.only(
    left: ConstValue.dp16,
    top: ConstValue.dp8,
    bottom: ConstValue.dp8,
  );

  static const EdgeInsets itemIconPadding = EdgeInsets.only(
    right: ConstValue.dp16,
  );

  static const double sidebarItemIconSize = ConstValue.dp24;

  // ************
  // Sidebar Item
  // ************

  static const TextStyle sidebarItemTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
  );
}
