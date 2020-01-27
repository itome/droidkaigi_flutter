import 'package:flutter/material.dart';
import 'package:confsched2020/repository/session_repository.dart';
import 'package:confsched2020/model/session_response.dart';
import 'package:confsched2020/model/room_response.dart';
import 'package:confsched2020/model/speaker_response.dart';
import 'package:confsched2020/model/category_response.dart';

class SessionStore extends ChangeNotifier {
  SessionStore({
    SessionRepository repository,
  }) : _repository = repository ?? SessionRepository();

  final SessionRepository _repository;

  List<SessionResponse> sessions = [];
  List<RoomResponse> rooms = [];
  List<SpeakerResponse> speakers = [];
  List<CategoryResponse> categories = [];

  Future<void> getSessions() async {
    final timetable = await _repository.getSessions();
    sessions = timetable.sessions;
    rooms = timetable.rooms;
    speakers = timetable.speakers;
    categories = timetable.categories;
    notifyListeners();
  }
}
