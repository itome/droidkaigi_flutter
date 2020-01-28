import 'package:flutter/material.dart';
import 'package:confsched2020/theme.dart';
import 'package:confsched2020/store/session_store.dart';
import 'package:confsched2020/view/page/sessions_page.dart';
import 'package:confsched2020/view/page/session_page.dart';
import 'package:confsched2020/l10n/delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SessionStore(),
      child: MaterialApp(
        title: 'Droidkaigi 2020',
        theme: lightTheme,
        initialRoute: '/',
        localizationsDelegates: [
          const L10nDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ja', ''), Locale('en', '')],
        routes: {
          '/': (context) => const SessionsPage(),
          '/session': (context) => const SessionPage(),
        },
      ),
    );
  }
}
