import 'package:flutter/material.dart';
import 'package:impostor/src/utils/constants/const_layout.dart';
import 'package:impostor/src/utils/extension/list_extension.dart';
import 'package:impostor/src/utils/responsive/presentation/responsive_layout.dart';

class EzFormItemLayout extends StatelessWidget {
  const EzFormItemLayout({
    super.key,
    required this.itemLabel,
    this.itemDescription,
    required this.child,
  });

  final String itemLabel;

  final String? itemDescription;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final itemDescription = this.itemDescription;

    return ResponsiveLayout(
      medium: (_, children) {
        final hasDescription = children!.length > 2;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: children[0],
              ),
            ),
            Expanded(
              flex: 2,
              child: hasDescription
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        children[1],
                        children[2],
                      ].withSpaceBetween(
                        height: ConstLayout.spacerSmall,
                      ),
                    )
                  : children[1],
            ),
          ],
        );
      },
      compact: (_, children) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children!.withSpaceBetween(height: ConstLayout.spacerSmall),
        );
      },
      children: [
        _buildText(context, itemLabel),
        child,
        if (itemDescription != null) _buildText(context, itemDescription),
      ],
    );
  }

  Widget _buildText(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context)
                .colorScheme
                .onSecondaryContainer
                .withOpacity(0.7),
          ),
    );
  }
}