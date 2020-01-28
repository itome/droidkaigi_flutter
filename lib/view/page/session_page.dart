import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:confsched2020/selector/session_selector.dart';
import 'package:confsched2020/ext/context.dart';

class SessionArgs {
  const SessionArgs({@required this.sessionId});

  final String sessionId;
}

class SessionPage extends StatefulWidget {
  const SessionPage({Key key}) : super(key: key);

  @override
  _SessionPageState createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  SessionArgs get _args => context.args<SessionArgs>();

  @override
  Widget build(BuildContext context) {
    final sessionInfo = context.select(getSessionById(_args.sessionId));

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              sessionInfo?.session?.title?.by(context) ?? '',
              style: context.theme.textTheme.title,
              textAlign: TextAlign.center,
            ),
            Text(
              'TODO: Session Detail Page',
              style: context.theme.textTheme.subtitle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
