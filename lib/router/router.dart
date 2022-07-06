import 'package:flutter/cupertino.dart';
import 'package:landmarks_flutter/model/landmark.dart';
import 'package:landmarks_flutter/widgets/landmarks/landmark_detail.dart';
import 'package:landmarks_flutter/widgets/landmarks/landmark_list.dart';
import 'package:landmarks_flutter/widgets/mainpage/main_page.dart';

class MyRouter {
  static const String initialRouter = MainPage.routerName;

  static final Map<String, WidgetBuilder> routers = {
    MainPage.routerName: (_) => const MainPage(),
    LandmarkList.routerName: (_) => const LandmarkList(),
  };

  static final Route<dynamic>? Function(RouteSettings)? generateRoute = (settings){
    if (settings.name == '/detail') {
      return CupertinoPageRoute(builder: (ctx) {
        Map map = settings.arguments as Map;
        Landmark landmark = map['landmark'];
        String preTitle = map['title'];
        return LandmarkDetail(previousTitle: preTitle, landmark: landmark);
      });
    }
  };
}