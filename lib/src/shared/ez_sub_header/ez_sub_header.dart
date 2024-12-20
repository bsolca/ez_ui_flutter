import 'package:ez_fit_app/src/shared/ez_header/ez_header.dart';
import 'package:flutter/material.dart';

/// Use under a [EzHeader] to display a sub title.
class EzSubHeader extends StatelessWidget {
  /// Use under a [EzHeader] to display a sub title.
  const EzSubHeader(
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
