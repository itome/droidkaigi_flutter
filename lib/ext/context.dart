import 'package:flutter/material.dart';
import 'package:confsched2020/l10n/localized.dart';
import 'package:confsched2020/l10n/message.dart';

extension BuildContextExt on BuildContext {
  ThemeData get theme {
    return Theme.of(this);
  }

  FocusScopeNode get focusScope {
    return FocusScope.of(this);
  }

  NavigatorState get navigator {
    return Navigator.of(this);
  }

  Message get localized {
    return Localized.of(this);
  }
}
