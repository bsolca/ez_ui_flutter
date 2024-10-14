import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:impostor/src/shared/ez_text_form_field/ez_text_form_field.dart';
import 'package:impostor/src/utils/extension/widget_ref_extension.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

/// Ez Phone number field for forms.
class EzFormPhoneField extends ConsumerWidget {
  /// Ez Phone number field for forms.
  const EzFormPhoneField({
    required this.controller,
    required this.hintText,
    this.autovalidateMode,
    super.key,
  });

  /// Controller for the phone field
  final TextEditingController controller;

  /// Hint text for the phone field
  final String hintText;

  /// Autovalidate mode for the phone field
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return EzTextFormField(
      autovalidateMode: autovalidateMode,
      validator: (value) {
        try {
          if (value == null ||
              value.isEmpty ||
              !PhoneNumber.parse(value).isValid()) {
            return ref.loc.phoneErrorMessageInvalid;
          }
        } on PhoneNumberException catch (e) {
          switch (e.code) {
            case Code.notFound:
              return ref.loc.phoneErrorMessageNotFound;
            case Code.invalid:
              return ref.loc.phoneErrorMessageInvalid;
            case Code.invalidCountryCallingCode:
              return ref.loc.phoneErrorMessageInvalidCountryCallingCode;
            case Code.invalidIsoCode:
              return ref.loc.phoneErrorMessageInvalidIsoCode;
            case Code.inputIsTooLong:
              return ref.loc.phoneErrorMessageInputIsTooLong;
          }
        }
        return null;
      },
      hintText: hintText,
      controller: controller,
    );
  }
}