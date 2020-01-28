import 'package:confsched2020/model/speaker_response.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:confsched2020/model/session_info.dart';
import 'package:confsched2020/theme.dart';
import 'package:confsched2020/ext/context.dart';
import 'package:confsched2020/ext/date_time.dart';

class SessionItem extends StatelessWidget {
  const SessionItem({
    Key key,
    @required this.sessionInfo,
    this.onSessionPressed,
    this.onSpeakerPressed,
    this.onBookmarkPressed,
  }) : super(key: key);

  final SessionInfo sessionInfo;

  final void Function(SessionInfo) onSessionPressed;

  final void Function(SpeakerResponse) onSpeakerPressed;

  final void Function(SessionInfo) onBookmarkPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed:
          onSessionPressed != null ? () => onSessionPressed(sessionInfo) : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              sessionInfo.session.startsAtDate.format(DateFormat.Hm()),
              style: context.theme.textTheme.subhead.disabled,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${context.localized.duration(sessionInfo.session.duration)} / ${sessionInfo.room.name.by(context)}',
                    style: context.theme.textTheme.caption.disabled,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    sessionInfo.session.title.by(context),
                    style: context.theme.textTheme.title,
                  ),
                  for (final speaker in sessionInfo.speakers)
                    SizedBox(
                      width: double.infinity,
                      child: FlatButton(
                        onPressed: onSpeakerPressed != null
                            ? () => onSpeakerPressed(speaker)
                            : null,
                        padding: EdgeInsets.zero,
                        child: Row(
                          children: <Widget>[
                            if (speaker.profilePicture != null)
                              CircleAvatar(
                                radius: 16,
                                backgroundImage: NetworkImage(
                                  speaker.profilePicture,
                                ),
                              ),
                            const SizedBox(width: 8),
                            Text(
                              speaker.fullName,
                              style: context.theme.textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(
              height: 24,
              width: 24,
              child: IconButton(
                onPressed: onBookmarkPressed != null
                    ? () => onBookmarkPressed(sessionInfo)
                    : null,
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.bookmark_border,
                  color: context.theme.colorScheme.secondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
