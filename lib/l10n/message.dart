import 'package:flutter/widgets.dart';

@immutable
class Message {
  const Message({
    @required this.locale,
    @required this.dayCount,
    @required this.event,
    @required this.myPlan,
    @required this.startFilter,
    @required this.duration,
    @required this.intendedAudienceTitle,
    @required this.speaker,
    @required this.materialLabel,
    @required this.movie,
    @required this.slide,
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
      locale: const Locale('en', ''),
      dayCount: (count) => 'DAY$count',
      event: 'EVENT',
      myPlan: 'MY PLAN',
      startFilter: 'Filter',
      duration: (minute) => '${minute}min',
      intendedAudienceTitle: 'Intended audience',
      speaker: 'Speaker',
      materialLabel: 'Material',
      movie: 'MOVIE',
      slide: 'SLIDE',
    );
  }

  factory Message.ja() {
    return Message(
      locale: const Locale('ja', ''),
      dayCount: (count) => 'DAY $count',
      event: 'EVENT',
      myPlan: 'MY PLAN',
      startFilter: '絞り込む',
      duration: (minute) => '$minute分',
      intendedAudienceTitle: '対象者',
      speaker: 'スピーカー',
      materialLabel: '資料',
      movie: '動画',
      slide: 'スライド',
    );
  }

  final Locale locale;
  final String Function(int) dayCount;
  final String event;
  final String myPlan;
  final String startFilter;
  final String Function(int) duration;
  final String intendedAudienceTitle;
  final String speaker;
  final String materialLabel;
  final String movie;
  final String slide;
}
