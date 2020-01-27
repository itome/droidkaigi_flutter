import 'package:flutter/widgets.dart';
import 'package:confsched2020/l10n/localized.dart';

class L10nDelegate extends LocalizationsDelegate<Localized> {
  const L10nDelegate();

  @override
  bool isSupported(Locale locale) => ['ja', 'en'].contains(locale.languageCode);

  @override
  Future<Localized> load(Locale locale) async => Localized(locale);

  @override
  bool shouldReload(L10nDelegate old) => false;
}
