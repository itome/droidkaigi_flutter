import 'package:confsched2020/store/session_store.dart';
import 'package:confsched2020/model/category_item_response.dart';
import 'package:confsched2020/model/session_info.dart';
import 'package:confsched2020/model/session_tab.dart';

final getSessionInfos = (SessionStore store) => store.sessions
    .map(
      (session) => SessionInfo(
        session: session,
        categories: [getCategoryItem(session.sessionCategoryItemId)(store)],
        room: store.rooms.firstWhere((room) => room.id == session.roomId),
        speakers: store.speakers
            .where((speaker) => session.speakers.contains(speaker.id))
            .toList(),
      ),
    )
    .toList();

final getDay1Sessions = (SessionStore store) => getSessionInfos(store)
    .where((info) => info.session.startsAtDate.day == 20)
    .toList();

final getDay2Sessions = (SessionStore store) => getSessionInfos(store)
    .where((info) => info.session.startsAtDate.day == 21)
    .toList();

final getSessionsForTab =
    (SessionTab tab) => (SessionStore store) => _getSessionsForTab(store, tab);

final getCategoryItem =
    (int id) => (SessionStore store) => _getCategoryItem(store, id);

final getSessionById = (String id) => (SessionStore store) =>
    getSessionInfos(store).firstWhere((info) => info.session.id == id);

List<SessionInfo> _getSessionsForTab(SessionStore store, SessionTab tab) {
  switch (tab) {
    case SessionTab.DAY1:
      return getDay1Sessions(store);
    case SessionTab.DAY2:
      return getDay2Sessions(store);
    default:
      return [];
  }
}

CategoryItemResponse _getCategoryItem(SessionStore store, int id) {
  for (final category in store.categories) {
    for (final item in category.items) {
      if (item.id == id) {
        return item;
      }
    }
  }
  return null;
}
