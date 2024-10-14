import 'package:flutter/material.dart';
import 'package:impostor/src/features/user_settings/model/user_settings.codegen.dart';
import 'package:impostor/src/features/user_settings/service/user_settings_service.codegen.dart';
import 'package:impostor/src/utils/log/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_settings_brightness_controller.codegen.g.dart';

/// Controller the [UserSettings].
@riverpod
class UserSettingsBrightnessController
    extends _$UserSettingsBrightnessController {
  /// Controller the [UserSettings].
  @override
  Future<Brightness?> build() async {
    final userSettingsRepo = ref.watch(
      userSettingsServiceProvider.notifier,
    );
    return userSettingsRepo.getBrightness();
  }

  /// Set the brightness.
  Future<void> setBrightness(Brightness? brightness) async {
    logInfo('Brightness changed to $brightness');
    await ref
        .read(
          userSettingsServiceProvider.notifier,
        )
        .setBrightness(brightness);
    state = AsyncData(brightness);
  }
}
