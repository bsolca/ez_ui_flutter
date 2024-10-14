import 'package:flutter/material.dart';

/// A widget that displays a list of items in a wrap menu.
class EzWrapMenuItem {

  /// Creates an item in the wrap menu.
  const EzWrapMenuItem({
    this.icon,
    required this.text,
    required this.onPressed,
  });

  /// Icon as prefix to the text.
  final IconData? icon;

  /// The text of the item.
  final String text;

  /// A callback that is called when the item is pressed.
  final VoidCallback onPressed;
}
