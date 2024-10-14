import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:impostor/src/shared/sub_header/sub_header.dart';
import 'package:impostor/src/utils/constants/const_value.dart';

enum _HeaderSize {
  displaySmall,
  displayMedium,
}

/// A header widget that displays a text with a specific style.
class EzHeader extends ConsumerWidget {
  /// Medium size header.
  const EzHeader.displayMedium(
    this.text, {
    super.key,
    this.subText,
    this.fit = BoxFit.scaleDown,
  }) : _size = _HeaderSize.displayMedium;

  /// Small size header.
  const EzHeader.displaySmall(
    this.text, {
    super.key,
    this.subText,
    this.fit = BoxFit.scaleDown,
  }) : _size = _HeaderSize.displaySmall;

  /// Header text to display.
  final String text;

  /// Secondary text to display.
  final String? subText;

  /// How to inscribe the child into the space allocated during layout.
  final BoxFit fit;

  final _HeaderSize _size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final medium = Theme.of(context).textTheme.titleMedium  ;
    final small = Theme.of(context).textTheme.titleSmall;
    final subText = this.subText;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(minHeight: ConstValue.dp36),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              softWrap: true,
              style: _size == _HeaderSize.displayMedium ? medium : small,
              text,
            ),
          ),
        ),
        if (subText != null) SubHeader(subText),
      ],
    );
  }
}
