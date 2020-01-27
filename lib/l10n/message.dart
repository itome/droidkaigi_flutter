import 'package:flutter/widgets.dart';

@immutable
class Message {
  const Message({
    @required this.dayCount,
    @required this.event,
    @required this.myPlan,
  });

  factory Message.of(Locale locale) {
    switch (locale.languageCode) {
      case 'ja':
        return Message.ja();
      default:
        return Message.en();
    }
  }

  factory Message.en() {
    return Message(
      dayCount: (count) => 'DAY$count',
      event: 'EVENT',
      myPlan: 'MY PLAN',
    );
  }

  factory Message.ja() {
    return Message(
      dayCount: (count) => 'DAY $count',
      event: 'EVENT',
      myPlan: 'MY PLAN',
    );
  }

  final String Function(int) dayCount;
  final String event;
  final String myPlan;
}
