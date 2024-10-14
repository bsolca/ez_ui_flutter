import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:impostor/src/utils/constants/const_layout.dart';
import 'package:impostor/src/utils/constants/const_value.dart';
import 'package:impostor/src/utils/extension/widget_ref_extension.dart';

/// To be used in the router pages as a starter for a new screen.
class EzScaffoldBody extends ConsumerWidget {
  /// To be used in the router pages as a starter for a new screen.
  const EzScaffoldBody({
    super.key,
    required this.child,
  });

  /// The child widget to be displayed in the scaffold body.
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCompact = ref.isCompactScreen;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: ConstValue.dp1024,
          ),
          padding: EdgeInsets.symmetric(
            vertical: ConstLayout.spacerSmall,
            horizontal: isCompact ? ConstLayout.spacer : ConstValue.dp64,
          ),
          child: child,
        ),
      ),
    );
  }
}
