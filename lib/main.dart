import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/config/constants.dart';
import 'package:canton_news_app/src/ui/views/current_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Lock screen orientation to vertical
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(ProviderScope(child: MyApp()));
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CantonApp(
      title: kAppTitle,
      primaryLightColor: CantonColors.green,
      primaryDarkColor: CantonDarkColors.green,
      home: CurrentView(),
    );
  }
}
