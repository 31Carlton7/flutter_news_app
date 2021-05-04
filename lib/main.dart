import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/config/constants.dart';
import 'package:canton_news_app/src/config/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(ProviderScope(child: MyApp()));
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppTitle,
      theme: cantonLightTheme().copyWith(primaryColor: CantonColors.green),
      home: CurrentScreen(),
    );
  }
}
