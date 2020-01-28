import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:confsched2020/selector/session_selector.dart';
import 'package:confsched2020/ext/context.dart';
import 'package:confsched2020/ext/date_time.dart';
import 'package:confsched2020/theme.dart';

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
      appBar: AppBar(
        backgroundColor: context.theme.colorScheme.background,
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: context.theme.colorScheme.secondary,
        child: Icon(
          Icons.bookmark_border,
          color: context.theme.colorScheme.onSecondary,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share,
                color: context.theme.colorScheme.onPrimary,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.place,
                color: context.theme.colorScheme.onPrimary,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.event,
                color: context.theme.colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 56, right: 24, left: 24),
        children: <Widget>[
          Text(
            sessionInfo.session.title.by(context),
            style: context.theme.textTheme.headline,
          ),
          const SizedBox(height: 24),
          Row(
            children: <Widget>[
              Icon(Icons.access_time, size: 14),
              const SizedBox(width: 8),
              Text(
                '${sessionInfo.session.startsAtDate.format(DateFormat.Md())}',
                style: context.theme.textTheme.caption,
              ),
              const SizedBox(width: 4),
              Text(
                '${sessionInfo.session.startsAtDate.format(DateFormat.Hm())} ~ ${sessionInfo.session.endsAtDate.format(DateFormat.Hm())}',
                style: context.theme.textTheme.caption,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '${context.localized.duration(sessionInfo.session.duration)} / ${sessionInfo.room.name.by(context)}',
            style: context.theme.textTheme.caption.disabled,
          ),
          const SizedBox(height: 24),
          Wrap(
            children: <Widget>[
              for (final category in sessionInfo.categories)
                Chip(label: Text(category.name.by(context))),
            ],
          ),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 24),
          Text(
            sessionInfo.session.description,
            style: context.theme.textTheme.body1,
          ),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 24),
          Text(
            context.localized.intendedAudienceTitle,
            style: context.theme.textTheme.subtitle,
          ),
          const SizedBox(height: 8),
          Text(
            sessionInfo.session.targetAudience,
            style: context.theme.textTheme.subtitle,
          ),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 24),
          Text(
            context.localized.speaker,
            style: context.theme.textTheme.subtitle,
          ),
          const SizedBox(height: 24),
          for (final speaker in sessionInfo.speakers)
            Row(
              children: <Widget>[
                if (speaker.profilePicture != null)
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(speaker.profilePicture),
                  ),
                const SizedBox(width: 16),
                Text(
                  speaker.fullName,
                  style: context.theme.textTheme.subtitle.copyWith(
                    color: context.theme.colorScheme.secondary,
                  ),
                ),
              ],
            ),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 24),
          Text(
            context.localized.materialLabel,
            style: context.theme.textTheme.subtitle,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 36,
            child: FlatButton(
              onPressed: () {},
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.movie,
                    color: context.theme.colorScheme.secondary,
                    size: 24,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    context.localized.movie,
                    style: context.theme.textTheme.button.copyWith(
                      color: context.theme.colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            height: 36,
            child: FlatButton(
              onPressed: () {},
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.image,
                    color: context.theme.colorScheme.secondary,
                    size: 24,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    context.localized.slide,
                    style: context.theme.textTheme.button.copyWith(
                      color: context.theme.colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
