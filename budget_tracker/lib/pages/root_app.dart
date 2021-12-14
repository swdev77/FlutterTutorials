import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:budget_tracker/pages/daily_page.dart';
import 'package:budget_tracker/pages/stats_page.dart';
import 'package:budget_tracker/theme/colors.dart';
import 'package:flutter/material.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setTabs(4);
        },
        child: const Icon(
          Icons.add,
          size: 24,
        ),
        backgroundColor: primary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        DailyPage(),
        StatsPage(),
        const Center(child: Text('Budget Page')),
        const Center(child: Text('Profile Page')),
        const Center(child: Text('Create budget Page')),
      ],
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      Icons.calendar_today,
      Icons.bar_chart,
      Icons.account_balance_wallet,
      Icons.person,
    ];

    return AnimatedBottomNavigationBar(
      icons: iconItems,
      activeColor: primary,
      inactiveColor: black.withOpacity(0.5),
      splashColor: secondary,
      activeIndex: pageIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      rightCornerRadius: 10,
      iconSize: 24,
      onTap: (index) {
        setTabs(index);
      },
    );
  }

  setTabs(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
