import 'package:flutter/material.dart';
import 'package:confsched2020/model/session_info.dart';
import 'package:confsched2020/ext/context.dart';

class SessionItem extends StatelessWidget {
  const SessionItem({Key key, @required this.sessionInfo}) : super(key: key);

  final SessionInfo sessionInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Text(
        sessionInfo.session.title.by(context),
        style: context.theme.textTheme.title,
      ),
    );
  }
}
