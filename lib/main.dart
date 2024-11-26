import 'package:breakingapi/app_route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp(appRoute:AppRoute(),));
}

class MyApp extends StatelessWidget {
  final AppRoute appRoute;
  const MyApp({super.key, required this.appRoute});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRoute.generateRoute,


    );
  }
}


