import 'package:flutter/widgets.dart';
import 'package:confsched2020/l10n/message.dart';

class Localized {
  Localized(Locale locale) : message = Message.of(locale);

  final Message message;

  static Message of(BuildContext context) {
    return Localizations.of<Localized>(context, Localized).message;
  }
}
