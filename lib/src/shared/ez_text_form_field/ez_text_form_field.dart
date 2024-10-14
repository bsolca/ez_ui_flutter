import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:impostor/src/shared/squircle/squircle.dart';
import 'package:impostor/src/utils/constants/const_layout.dart';

/// Styled text form field.
class EzTextFormField extends ConsumerWidget {
  /// Styled text form field.
  const EzTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.inputFormatters,
    this.focusNode,
    this.onEditingComplete,
    this.validator,
    this.autovalidateMode,
    this.maxLength,
    this.autofocus = false,
    this.obscureText = false,
  })  : buttonText = null,
        onButtonPressed = null;

  ///
  const EzTextFormField.withButton({
    super.key,
    required this.hintText,
    required this.controller,
    this.inputFormatters,
    this.focusNode,
    this.onEditingComplete,
    this.validator,
    this.autovalidateMode,
    this.maxLength,
    this.autofocus = false,
    this.obscureText = false,
    required String this.buttonText,
    required VoidCallback this.onButtonPressed,
  });

  /// Mandatory hint text.
  final String hintText;

  /// Controller of the text form field.
  final TextEditingController controller;

  /// Input formatters of the text form field.
  final List<TextInputFormatter>? inputFormatters;

  /// Focus node of the text form field.
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.editableText.onEditingComplete}
  final void Function()? onEditingComplete;

  /// Validator of the text form field.
  final String? Function(String?)? validator;

  /// Auto validate mode of the text form field.
  final AutovalidateMode? autovalidateMode;

  /// Max length of the text form field.
  final int? maxLength;

  /// Whether the text form field is autofocus or not.
  final bool autofocus;

  /// Whether the text form field obscure text or not.
  final bool obscureText;

  /// Widget to be displayed inside the button.
  final String? buttonText;

  /// Callback to be called when the button is pressed.
  final VoidCallback? onButtonPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buttonText = this.buttonText;
    final isWithButton = buttonText != null && onButtonPressed != null;
    const radius = ConstLayout.borderRadiusSmall;
    final borderRadius = isWithButton
        ? const SmoothBorderRadius.horizontal(
            left: SmoothRadius(
              cornerRadius: radius,
              cornerSmoothing: ConstLayout.cornerSmoothing,
            ),
          )
        : SmoothBorderRadius(
            cornerRadius: radius,
            cornerSmoothing: ConstLayout.cornerSmoothing,
          );

    final fieldWidget = TextFormField(
      controller: controller,
      autofocus: autofocus,
      focusNode: focusNode,
      inputFormatters: inputFormatters,
      validator: validator,
      autovalidateMode: autovalidateMode,
      maxLength: maxLength,
      obscureText: obscureText,
      onEditingComplete: onEditingComplete,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
            fontWeight: FontWeight.bold,
          ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context)
                  .colorScheme
                  .onSecondaryContainer
                  .withOpacity(
                    0.5,
                  ),
            ),
        isDense: true,
        // To have 40 height to respect ConstLayout.itemHeight
        contentPadding: const EdgeInsets.all(12),
        fillColor: Theme.of(context).colorScheme.surfaceContainer,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 0.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 0.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide.none,
        ),
      ),
    );

    final textFormFieldWidget = isWithButton
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: fieldWidget,
              ),
              SizedBox(
                height: ConstLayout.itemHeight,
                child: ElevatedButton(
                  onPressed: onButtonPressed,
                  style: OutlinedButton.styleFrom(
                    elevation: 0,
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    shape: const RoundedRectangleBorder(
                      borderRadius: SmoothBorderRadius.only(
                        topRight: SmoothRadius(
                          cornerRadius: radius,
                          cornerSmoothing: ConstLayout.cornerSmoothing,
                        ),
                        bottomRight: SmoothRadius(
                          cornerRadius: radius,
                          cornerSmoothing: ConstLayout.cornerSmoothing,
                        ),
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      buttonText,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
              ),
            ],
          )
        : fieldWidget;
    return textFormFieldWidget;
  }
}