import 'package:confsched2020/model/category_item_response.dart';
import 'package:confsched2020/model/session_response.dart';
import 'package:confsched2020/model/room_response.dart';
import 'package:confsched2020/model/speaker_response.dart';

class SessionInfo {
  const SessionInfo({
    this.session,
    this.room,
    this.speakers,
    this.categories,
  });

  final SessionResponse session;
  final RoomResponse room;
  final List<SpeakerResponse> speakers;
  final List<CategoryItemResponse> categories;
}
