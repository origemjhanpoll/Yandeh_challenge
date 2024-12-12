import 'package:flutter/widgets.dart';
import 'package:yandeh_challenge/app/app.dart';
import 'package:yandeh_challenge/app/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Future.delayed(const Duration(milliseconds: 100)); // Adiciona delay
  runApp(const App());
}
