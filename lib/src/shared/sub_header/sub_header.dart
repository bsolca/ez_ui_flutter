import 'package:flutter/material.dart';
import 'package:impostor/src/shared/ez_header/ez_header.dart';

/// Use under a [EzHeader] to display a sub title.
class SubHeader extends StatelessWidget {
  /// Use under a [EzHeader] to display a sub title.
  const SubHeader(
    this.text, {
    super.key,
    this.fit = BoxFit.scaleDown,
  });

  /// Txt to display.
  final String text;

  /// How to inscribe the child into the space allocated during layout.
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
    );
  }
}
