import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:confsched2020/ext/context.dart';
import 'package:confsched2020/selector/session_selector.dart';
import 'package:confsched2020/model/session_tab.dart';
import 'package:confsched2020/view/component/session_item.dart';
import 'package:confsched2020/view/page/session_page.dart';

class SessionsTabPage extends StatefulWidget {
  const SessionsTabPage({Key key, @required this.tab})
      : assert(tab != null),
        super(key: key);

  final SessionTab tab;

  @override
  _SessionsTabPageState createState() => _SessionsTabPageState();
}

class _SessionsTabPageState extends State<SessionsTabPage> {
  @override
  Widget build(BuildContext context) {
    final sessions = context.select(getSessionsForTab(widget.tab));

    return Stack(
      children: <Widget>[
        Container(
          color: context.theme.primaryColor,
        ),
        DraggableScrollableSheet(
          maxChildSize: 0.96,
          initialChildSize: 0.96,
          minChildSize: 0.2,
          builder: (context, controller) {
            return ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
              ),
              child: Container(
                color: context.theme.backgroundColor,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 56,
                      width: double.infinity,
                      child: FlatButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Icon(Icons.sort),
                            const SizedBox(width: 8),
                            Text(
                              context.localized.startFilter,
                              style: context.theme.textTheme.button,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      indent: 16,
                      endIndent: 16,
                      height: 1,
                      thickness: 1,
                    ),
                    Expanded(
                      child: ListView.builder(
                        controller: controller,
                        itemCount: sessions.length,
                        itemBuilder: (context, index) {
                          return SessionItem(
                            sessionInfo: sessions[index],
                            onSessionPressed: (info) {
                              context.navigator.pushNamed(
                                '/session',
                                arguments: SessionArgs(
                                  sessionId: info.session.id,
                                ),
                              );
                            },
                            onSpeakerPressed: (_) {
                              // TODO(itome): Navigate to speaker page.
                            },
                            onBookmarkPressed: (_) {
                              // TODO(itome): Bookmark session.
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
