import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game_demo/screens/endless_runner.dart';
import 'package:game_demo/screens/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.setLandscape();
  await Flame.device.fullScreen();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    HomeScreen screen= HomeScreen();
    EndlessRunner runner=EndlessRunner();
    return GameWidget(game:runner);
  
  }
}

