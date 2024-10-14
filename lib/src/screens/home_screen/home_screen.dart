import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:impostor/src/features/ez_scaffold_body/ez_scaffold_body.dart';

/// Home screen for "/" route.
class HomeScreen extends ConsumerWidget {
  /// Home screen for "/" route.
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const EzScaffoldBody(
      child: Text('Todo Home screen'),
    );
  }
}
