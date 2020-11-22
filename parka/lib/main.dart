import 'package:ParkA/pages/splash-screen/splash_screen.dart';
import 'package:ParkA/routes/routes.dart';
import 'package:ParkA/utils/prefs/shared_preferencies.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/bindings/graphql_biding.dart';

void main() {
  runApp(ParkApp());
}

class ParkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    new SharedPreferenciesUtil();

    return GetMaterialApp(
      title: 'ParkA',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: getRoutePages,
      initialBinding: GraphqlClientBiding(),
      initialRoute: SplashScreen.routeName,
    );
  }
}
