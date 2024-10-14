// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:impostor/src/shared/squircle/squircle.dart';
import 'package:impostor/src/utils/constants/const_value.dart';

class ConstLayout {
  ConstLayout._();

  // Spacers
  static const double spacerExtraSmall = ConstValue.dp4;
  static const double spacerSmall = ConstValue.dp8;
  static const double spacer = ConstValue.dp16;
  static const double spacerMedium = ConstValue.dp24;

  // Borders and Corners
  static const double borderSize = ConstValue.dp1;
  static const double borderRadiusSmall = ConstValue.dp8;
  static const double borderRadius = ConstValue.dp16;
  static const double cornerSmoothing = ConstValue.dp05;

  // Button and Icon Sizes
  static const double buttonHeight = ConstValue.dp48;
  static const double iconSmallSize = ConstValue.dp16;
  static const double iconMediumSize = ConstValue.dp24;

  // Layout Dimensions
  static const double maxWidthCompact = ConstValue.dp1024;
  static const double maxWidthMedium = ConstValue.dp2048;

  // Avatar Sizes
  static const double avatarMediumSize = ConstValue.dp64;
  static const double avatarLargeSize = ConstValue.dp128;
  static const double avatarSmallSize = ConstValue.dp32;
  static const double avatarWidthSize = ConstValue.dp192;
  static const double avatarExtraSmallSize = ConstValue.dp48;
  static const double maxPlayerCardWidthSize = avatarMediumSize * 3;

  // Sizes
  static const double itemHeight = ConstValue.dp40;
  static const double medalSize = ConstValue.dp48;

  // Colors
  static Color getBackgroundColor(ColorScheme colorScheme) =>
      colorScheme.brightness == Brightness.dark
          ? colorScheme.surfaceContainerHigh
          : colorScheme.surface;

  static Color getMainBorderColor(ColorScheme colorScheme) =>
      colorScheme.brightness == Brightness.dark
          ? colorScheme.surfaceContainer
          : colorScheme.surfaceContainerHighest;

  static Color getSecondaryBackgroundColor(ColorScheme colorScheme) =>
      colorScheme.brightness == Brightness.dark
          ? colorScheme.surface
          : colorScheme.surfaceContainer;

  // Radius
  static const double itemBorderRadius = ConstValue.dp8;
  static const double itemBorderSmoothing = 0.4;

  static ShapeBorder getShapeBorder() {
    return SmoothRectangleBorder(
      borderRadius: SmoothBorderRadius(
        cornerRadius: itemBorderRadius,
        cornerSmoothing: itemBorderSmoothing,
      ),
    );
  }
}
