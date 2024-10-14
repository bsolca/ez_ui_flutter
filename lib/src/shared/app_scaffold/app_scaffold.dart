import 'package:flutter/material.dart';
import 'package:impostor/src/features/sidebar/sidebar.dart';

/// Scaffold widget for the app.
class AppScaffold extends StatelessWidget {
  /// Scaffold widget for the app.
  const AppScaffold({
    required this.body,
    super.key,
  });

  /// The widget to display in the body of the scaffold.
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Sidebar(child: body),
    );
  }
}
