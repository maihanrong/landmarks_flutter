import 'package:flutter/cupertino.dart';
import 'package:landmarks_flutter/router/router.dart';
import 'package:landmarks_flutter/viewmodel/landmark_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => LandmarkViewModel())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'landmarks',
      initialRoute: MyRouter.initialRouter,
      routes: MyRouter.routers,
      onGenerateRoute: MyRouter.generateRoute,
    );
  }
}