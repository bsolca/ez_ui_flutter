import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:impostor/src/shared/ez_button/data/ez_button_enum.dart';
import 'package:impostor/src/shared/ez_button/ez_button.dart';
import 'package:impostor/src/shared/ez_file_uploader/ez_file_uploader.dart';
import 'package:impostor/src/shared/ez_form/ez_form_email_field/ez_form_email_field.dart';
import 'package:impostor/src/shared/ez_form/ez_form_item_layout/ez_form_item_layout.dart';
import 'package:impostor/src/shared/ez_header/ez_header.dart';
import 'package:impostor/src/shared/ez_text_form_field/ez_text_form_field.dart';
import 'package:impostor/src/utils/constants/const_layout.dart';
import 'package:impostor/src/utils/extension/list_extension.dart';
import 'package:impostor/src/utils/extension/widget_ref_extension.dart';

/// A screen that displays the user settings.
class UserSettingsScreen extends ConsumerWidget {
  /// Screen that displays the user settings.
  const UserSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    final usernameController = TextEditingController();
    final emailController = TextEditingController();
    final locationController = TextEditingController();
    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final instagramController = TextEditingController();
    final tiktokController = TextEditingController();
    final stravaController = TextEditingController();
    final facebookController = TextEditingController();
    final whatsappController = TextEditingController();
    final snapchatController = TextEditingController();


    return ListView(
      children: [
        EzHeader.displayMedium(
          ref.loc.settingScreenSettings,
        ),
        const SizedBox(height: ConstLayout.spacerSmall),
        // Avatar
        EzFormItemLayout(
          itemLabel: ref.loc.settingScreenAvatar,
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: ConstLayout.spacer,
            spacing: ConstLayout.spacer,
            children: [
              const CircleAvatar(
                radius: ConstLayout.avatarSmallSize,
                child: Text('Ez'),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    runSpacing: ConstLayout.spacer,
                    spacing: ConstLayout.spacer,
                    children: [
                      EzButton(
                        onPressed: () {},
                        text: 'Upload photo',
                        type: EzButtonType.outlined,
                      ),
                      const EzButton(
                        onPressed: null,
                        text: 'Delete photo',
                        type: EzButtonType.outlined,
                      ),
                    ],
                  ),
                  const Text('Pick a photo up to 6MB.'),
                ],
              ),
            ],
          ),
        ),
        // Cover photo
        EzFormItemLayout(
          itemLabel: ref.loc.settingScreenCoverPhoto,
          child: EzFileUploader(
            onFilesSelected: (files) {
              print('Files selected: $files');
            },
          ),
        ),
        EzHeader.displayMedium(
          ref.loc.settingScreenPersonalInformation,
        ),
        const Divider(),
        EzFormItemLayout(
          itemLabel: ref.loc.settingScreenName,
          itemDescription: ref.loc.settingScreenNameDescription,
          child: EzTextFormField(
            hintText: 'John Doe',
            controller: nameController,
          ),
        ),
        EzFormItemLayout(
          itemLabel: ref.loc.settingScreenUsername,
          itemDescription: ref.loc.settingScreenUserNameDescription,
          child: EzTextFormField(
            hintText: 'john_doe',
            controller: usernameController,
          ),
        ),
        EzFormItemLayout(
          itemLabel: ref.loc.settingScreenEmail,
          itemDescription: ref.loc.settingScreenEmailDescription,
          child: EzFormEmailField(
            hintText: 'john.doe@site.com',
            autovalidateMode: AutovalidateMode.always,
            controller: emailController,
          ),
        ),
        EzFormItemLayout(
          itemLabel: ref.loc.settingScreenLocation,
          child: EzTextFormField(
            hintText: 'Genève, Suisse',
            controller: locationController,
          ),
        ),
        EzHeader.displayMedium(
          ref.loc.settingScreenPassword,
        ),
        const Divider(),
        EzFormItemLayout(
          itemLabel: ref.loc.settingScreenCurrentPassword,
          child: EzTextFormField(
            hintText: '************',
            obscureText: true,
            controller: currentPasswordController,
          ),
        ),
        EzFormItemLayout(
          itemLabel: ref.loc.settingScreenNewPassword,
          child: EzTextFormField(
            hintText: '************',
            obscureText: true,
            controller: newPasswordController,
          ),
        ),
        EzHeader.displayMedium(
          ref.loc.settingScreenSocialAccounts,
        ),
        const Divider(),
        EzFormItemLayout(
          itemLabel: 'Instagram',
          child: EzTextFormField(
            hintText: '@username',
            controller: instagramController,
          ),
        ),
        EzFormItemLayout(
          itemLabel: 'Tiktok',
          child: EzTextFormField(
            hintText: '@username',
            controller: tiktokController,
          ),
        ),
        EzFormItemLayout(
          itemLabel: 'Strava',
          child: EzTextFormField(
            hintText: '@username',
            controller: stravaController,
          ),
        ),
        EzFormItemLayout(
          itemLabel: 'Facebook',
          child: EzTextFormField(
            hintText: '@username',
            controller: facebookController,
          ),
        ),
        EzFormItemLayout(
          itemLabel: 'Whatsapp',
          child: EzTextFormField(
            hintText: '+41 123 456 789',
            controller: whatsappController,
          ),
        ),
        EzFormItemLayout(
          itemLabel: 'Snapchat',
          child: EzTextFormField(
            hintText: '@username',
            controller: snapchatController,
          ),
        ),
        EzHeader.displayMedium(
          ref.loc.settingScreenDangerZone,
        ),
        const Divider(),
        EzFormItemLayout(
          itemLabel: ref.loc.settingScreenDangerZoneAccountDeletion,
          itemDescription: ref.loc.settingScreenDangerZoneDescription,
          child: EzButton(
            onPressed: () {},
            textColor: Colors.red,
            text: 'Delete account',
            type: EzButtonType.outlined,
          ),
        ),
      ].withSpaceBetween(
        height: ConstLayout.spacerSmall,
      ),
    );
  }
}
