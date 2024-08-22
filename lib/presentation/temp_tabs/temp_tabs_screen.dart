import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:template_app/presentation/app/app_router.dart';

@RoutePage()
class TempTabsScreen extends StatelessWidget {
  const TempTabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      transitionBuilder: (_, child, __) => child,
      routes: const [
        FirstTab(),
        SecondTab(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              // here we switch between tabs
              tabsRouter.setActiveIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                label: 'tab1',
                icon: Icon(
                  Icons.audiotrack,
                  color: Colors.green,
                  size: 30.0,
                ),
              ),
              BottomNavigationBarItem(
                label: 'tab2',
                icon: Icon(
                  Icons.beach_access,
                  color: Colors.blue,
                  size: 36.0,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
