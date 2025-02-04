import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:poem/router/app_router.gr.dart';

@RoutePage()
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // var _selectedPageIndex = 0;
  // final _pageContoller = PageController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return
        // body: PageView(
        //     controller: _pageContoller,
        //     onPageChanged: (value) {
        //       setState(() {
        //         _selectedPageIndex = value;
        //       });
        //     },
        //     children: [
        //       SearchScreen(theme: theme),
        //       FavoriteScreen(),
        //       HistoryScreen(),
        //       SettingsScreen(),
        //     ]),
        AutoTabsRouter(
      routes: [
        SearchRoute(theme: theme),
        FavoriteRoute(),
        HistoryRoute(),
        SettingsRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
                unselectedItemColor: Colors.red,
                selectedItemColor: Colors.green,
                currentIndex: tabsRouter.activeIndex,
                onTap: (index) => openPage(index, tabsRouter),
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                      ),
                      label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: 'Favorite'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.history), label: 'history'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: 'Settings')
                ]));
      },
    );
  }

  void openPage(int index, TabsRouter tabsRouter) {
    setState(() {
      // _selectedPageIndex = index;
      tabsRouter.setActiveIndex(index);
      // _pageContoller.animateToPage(index,
      //     duration: Duration(
      //       microseconds: 300,
      //     ),
      //     curve: Curves.bounceInOut);
    });
  }
}
