import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import 'package:moviz/services/http_services.dart';
import 'package:moviz/services/movie_service.dart';

import 'models/app_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.onInitializationComplete})
      : super(key: key);
  final VoidCallback onInitializationComplete;
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // setState(() {
    //   _setup(context);
    // });
    Future.delayed(Duration(seconds: 1)).then((_) => _setup(context));
    widget.onInitializationComplete();
    // Future.delayed(Duration(seconds: 1)).then((_) => () {
    //       widget.onInitializationComplete();
    //     });

    // Timer(Duration(seconds: 1), widget.onInitializationComplete);
  }

  Future<void> _setup(BuildContext context) async {
    final getIt = GetIt.instance;
    final configFile = await rootBundle.loadString('assets/config/main.json');
    final configData = jsonDecode(configFile);

    getIt.registerSingleton<AppConfig>(AppConfig(
      BASE_API_URL: configData['BASE_API_URL'],
      API_KEY: configData['API_KEY'],
      BASE_IMAGE_API_KEY: configData['BASE_IMAGE_API_KEY'],
    ));

    getIt.registerSingleton<HTTPService>(HTTPService());
    getIt.registerSingleton<MovieServive>(MovieServive());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Scaffold(
        body: Center(
          child: Text('knfdfdhs'),
        ),
      ),
    );
  }
}
