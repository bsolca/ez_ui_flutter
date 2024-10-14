import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:impostor/src/shared/ez_text_form_field/ez_text_form_field.dart';

/// Ez Email field for forms.
class EzFormEmailField extends ConsumerWidget {
  /// Ez Email field for forms.
  const EzFormEmailField({
    required this.controller,
    required this.hintText,
    this.autovalidateMode,
    super.key,
  });

  /// Controller for the email field
  final TextEditingController controller;

  /// Hint text for the email field
  final String hintText;

  /// Autovalidate mode for the email field
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return EzTextFormField(
      autovalidateMode: autovalidateMode,
      validator: (value) {
        const errorMessage = 'Please enter a valid email address.';
        if (value == null || value.isEmpty) {
          return errorMessage;
        }
        return EmailValidator.validate(value) ? null : errorMessage;
      },
      hintText: hintText,
      controller: controller,
    );
  }
}
