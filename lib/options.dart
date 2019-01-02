import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:tests/themes.dart';

const Duration kAnimationDuration = Duration(microseconds: 200);

class AppOptions {
  AppOptions({this.theme, this.platform});

  final AppTheme theme;
  final TargetPlatform platform;

  AppOptions copyWith({AppTheme theme, TargetPlatform platform}) {
    return AppOptions(
        theme: theme ?? this.theme, platform: platform ?? this.platform);
  }

  bool operator ==(dynamic other) {
    if (runtimeType != other.runtimeType) {
      return false;
    }
    final AppOptions typedOther = other;
    return theme == typedOther.theme && platform == typedOther.platform;
  }

  @override
  int get hashCode => hashValues(theme, platform);

  @override
  String toString() {
    return '$runtimeType($theme)';
  }
}
