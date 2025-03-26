import 'package:al_busayra_project/base_widget/al_busayra_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dependencies/controller_dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  ).then(
    (_) {
      runApp(
        const AlBusayraApp(),
      );
    },
  );
}
