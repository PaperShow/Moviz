import 'package:flutter/material.dart';
import 'package:moviz/homepage.dart';
import 'package:moviz/splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(SplashScreen(
      key: UniqueKey(),
      onInitializationComplete: () => runApp(ProviderScope(child: MyApp()))));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: MainPage(),
      // initialRoute: 'home',
      // routes: {'home': (context) => MainPage()},
    );
  }
}
