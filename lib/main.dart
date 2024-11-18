import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'oddo_main.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await initializeService();
  runApp(const OddoMain());
}

Future<void> initializeService() async {
  final service = FlutterBackgroundService();

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      isForegroundMode: true,
    ),
    iosConfiguration: IosConfiguration(
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
  );

  service.startService();
}

bool onIosBackground(ServiceInstance service) {
  WidgetsFlutterBinding.ensureInitialized();
  return true;
}

void onStart(ServiceInstance service) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  service.on('start').listen((event) async {
    // Start or resume the timer
    int startTime = prefs.getInt('startTime') ?? DateTime.now().millisecondsSinceEpoch;
    prefs.setInt('startTime', startTime);

    service.on('pause').listen((event) async {
      // Pause the timer
      int elapsedTime = DateTime.now().millisecondsSinceEpoch - startTime;
      prefs.setInt('elapsedTime', elapsedTime);
    });
  });

  service.on('kill').listen((event) async {
    service.stopSelf();
  });
}