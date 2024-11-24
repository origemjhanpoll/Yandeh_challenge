import 'package:flutter/material.dart';
import 'package:yandeh_challenge/app/app.dart';
import 'package:yandeh_challenge/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(const App());
}
