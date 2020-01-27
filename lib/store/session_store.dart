import 'package:confsched2020/model/category_item_response.dart';
import 'package:flutter/material.dart';
import 'package:confsched2020/repository/session_repository.dart';
import 'package:confsched2020/model/session_response.dart';
import 'package:confsched2020/model/room_response.dart';
import 'package:confsched2020/model/speaker_response.dart';
import 'package:confsched2020/model/category_response.dart';
import 'package:confsched2020/model/session_info.dart';
import 'package:confsched2020/model/session_tab.dart';

class SessionStore extends ChangeNotifier {
  SessionStore({
    SessionRepository repository,
  }) : _repository = repository ?? SessionRepository();

  final SessionRepository _repository;

  List<SessionResponse> sessions = [];
  List<RoomResponse> rooms = [];
  List<SpeakerResponse> speakers = [];
  List<CategoryResponse> categories = [];

  List<SessionInfo> get sessionInfos => sessions
      .map(
        (session) => SessionInfo(
          session: session,
          categories: [_getCategoryItem(session.sessionCategoryItemId)],
          room: rooms.firstWhere((room) => room.id == session.roomId),
          speakers: speakers
              .where((speaker) => session.speakers.contains(speaker.id))
              .toList(),
        ),
      )
      .toList();

  List<SessionInfo> get day1Sessions => sessionInfos
      .where((info) => info.session.startsAtDate.day == 20)
      .toList();

  List<SessionInfo> get day2Sessions => sessionInfos
      .where((info) => info.session.startsAtDate.day == 21)
      .toList();

  List<SessionInfo> getSessionsForTab(SessionTab tab) {
    switch (tab) {
      case SessionTab.DAY1:
        return day1Sessions;
      case SessionTab.DAY2:
        return day2Sessions;
      default:
        return [];
    }
  }

  Future<void> getSessions() async {
    final timetable = await _repository.getSessions();
    sessions = timetable.sessions;
    rooms = timetable.rooms;
    speakers = timetable.speakers;
    categories = timetable.categories;
    notifyListeners();
  }

  CategoryItemResponse _getCategoryItem(int id) {
    for (final category in categories) {
      for (final item in category.items) {
        if (item.id == id) {
          return item;
        }
      }
    }
    return null;
  }
}
