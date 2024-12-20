import 'package:ez_fit_app/src/utils/constants/ez_const_string.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hive_provider.codegen.g.dart';

/// The provider that provides the id in storage.
@Riverpod(keepAlive: true)
Box<String?> hiveIdBox(Ref ref) {
  return Hive.box<String?>(EzConstString.hiveId);
}

/// The provider that provides the user settings box.
@Riverpod(keepAlive: true)
Box<String> hiveUserSettingsBox(Ref ref) {
  return Hive.box<String>(EzConstString.hiveUserSettings);
}
