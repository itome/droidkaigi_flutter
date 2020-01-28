import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:confsched2020/store/session_store.dart';
import 'package:confsched2020/ext/context.dart';
import 'package:confsched2020/view/page/sessions_tab_page.dart';
import 'package:confsched2020/model/session_tab.dart';

class SessionsPage extends StatefulWidget {
  const SessionsPage({Key key}) : super(key: key);

  @override
  _SessionsPageState createState() => _SessionsPageState();
}

class _SessionsPageState extends State<SessionsPage> {
  @override
  void initState() {
    super.initState();
    context.read<SessionStore>().getSessions();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Image.asset('assets/app_icon.png', width: 24, height: 24),
          backgroundColor: context.theme.primaryColor,
          iconTheme: IconThemeData(color: context.theme.colorScheme.onPrimary),
          bottom: TabBar(
            tabs: [
              Tab(child: Text(context.localized.dayCount(1))),
              Tab(child: Text(context.localized.dayCount(2))),
              Tab(child: Text(context.localized.event)),
              Tab(child: Text(context.localized.myPlan)),
            ],
          ),
        ),
        drawer: const Drawer(),
        body: const TabBarView(
          children: [
            SessionsTabPage(tab: SessionTab.DAY1),
            SessionsTabPage(tab: SessionTab.DAY2),
            SessionsTabPage(tab: SessionTab.EVENT),
            SessionsTabPage(tab: SessionTab.MY_PLAN),
          ],
        ),
      ),
    );
  }
}
