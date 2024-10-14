// sidebar_item_brightness.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:impostor/src/features/user_settings/ui/controller/user_settings_brightness_controller.codegen.dart';
import 'package:impostor/src/shared/ez_icon/hero_icon_icons.dart';
import 'package:impostor/src/shared/ez_sidebar/model/ez_sidebar_item_data.codegen.dart';
import 'package:impostor/src/utils/extension/widget_ref_extension.dart';

/// Builds an EzSidebarItemData configured for brightness switching.
class SidebarItemBrightness {
  /// Builds an EzSidebarItemData configured for brightness switching.
  static EzSidebarItemData build(WidgetRef ref, BuildContext context) {
    final brightness = ref.watch(userSettingsBrightnessControllerProvider);
    return brightness.when(
      data: (brightness) {
        final brightnessNotifier = ref.read(
          userSettingsBrightnessControllerProvider.notifier,
        );

        var switchToText = ref.loc.switchSystem;
        var switchToIcon = HeroIcon.computerDesktop;

        if (brightness == Brightness.light) {
          switchToText = ref.loc.switchLight;
          switchToIcon = HeroIcon.moon;
        } else if (brightness == Brightness.dark) {
          switchToText = ref.loc.switchDark;
          switchToIcon = HeroIcon.sun;
        }

        return EzSidebarItemData.bottom(
          text: switchToText,
          icon: switchToIcon,
          onTap: () async {

            if (brightness == Brightness.light) {
              await brightnessNotifier.setBrightness(Brightness.dark);
            } else if (brightness == Brightness.dark) {
              await brightnessNotifier.setBrightness(null);
            } else {
              await brightnessNotifier.setBrightness(Brightness.light);
            }
          },
        );
      },
      error: (error, _) => throw error,
      loading: () => EzSidebarItemData.bottom(
        text: '${ref.loc.loading}...',
        icon: HeroIcon.computerDesktop,
        onTap: () {}, // to do null
      ),
    );
  }
}
