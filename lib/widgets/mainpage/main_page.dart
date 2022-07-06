import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:landmarks_flutter/router/router.dart';
import 'package:landmarks_flutter/widgets/category/category_home.dart';
import 'package:landmarks_flutter/widgets/landmarks/landmark_list.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  static const String routerName = '/';

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Featured'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
          ],
        ),
        tabBuilder: (ctx, index) {
          return CupertinoTabView(
            builder: (ctx) {
              switch (index) {
                case 0:
                  return CategoryHome();
                case 1:
                  return LandmarkList();
                default:
                  return Container();
              }
            },
            onGenerateRoute: MyRouter.generateRoute,
          );
        }
    );
  }
}