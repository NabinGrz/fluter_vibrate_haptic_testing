import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        splashFactory: InkRipple.splashFactory,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int number = 1000000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {},
              splashColor: Colors.red,
              highlightColor: Colors.blue,
              splashFactory: InkRipple.splashFactory,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("InkRipple Splashfactory"),
              ),
            ),
            InkWell(
              onTap: () {},
              splashColor: Colors.red,
              highlightColor: Colors.blue,
              splashFactory: InkSplash.splashFactory,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("InkSplash Splashfactory"),
              ),
            ),
            InkWell(
              onTap: () {},
              splashColor: Colors.red,
              highlightColor: Colors.blue,
              splashFactory: InkSparkle.splashFactory,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("InkSparkle Splashfactory"),
              ),
            ),
            InkWell(
              onTap: () {},
              splashColor: Colors.red,
              highlightColor: Colors.blue,
              splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("InkSparkle constantTurbulenceSeedSplashFactory"),
              ),
            ),
            InkWell(
              onTap: () {},
              splashColor: Colors.red,
              highlightColor: Colors.blue,
              splashFactory: NoSplash.splashFactory,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("No Splash"),
              ),
            ),
            TextButton(
              style: const ButtonStyle(
                splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
              ),
              onPressed: () {
                if (Platform.isIOS) {
                  HapticFeedback.selectionClick();
                  HapticFeedback.vibrate();
                } else {
                  Vibration.vibrate(duration: 100);
                  HapticFeedback.vibrate();
                }
              },
              child: const Text("Selection Click"),
            ),
            TextButton(
              onPressed: () {
                if (Platform.isIOS) {
                  HapticFeedback.heavyImpact();
                } else {
                  Vibration.vibrate(duration: 200);
                }
              },
              child: const Text("Heavy Impact"),
            ),
            TextButton(
              onPressed: () {
                if (Platform.isIOS) {
                  HapticFeedback.lightImpact();
                } else {
                  Vibration.vibrate(duration: 200);
                }
              },
              child: const Text("Light Impact"),
            ),
            TextButton(
              onPressed: () {
                if (Platform.isIOS) {
                  HapticFeedback.mediumImpact();
                } else {
                  Vibration.vibrate(duration: 200);
                }
              },
              child: const Text("Medium Impact"),
            ),
          ],
        ),
      ),
    );
  }
}
