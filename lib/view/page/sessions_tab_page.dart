import 'package:flutter/material.dart';
import 'package:confsched2020/ext/context.dart';

enum SessionTab {
  DAY1,
  DAY2,
  EVENT,
  MY_PLAN,
}

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
                child: ListView.builder(
                  controller: controller,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
