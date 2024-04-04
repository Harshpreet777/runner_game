
import 'dart:async';

import 'package:flame/game.dart';
import 'package:game_demo/screens/background.dart';

class EndlessRunner extends FlameGame{
  @override
  FutureOr<void> onLoad() {
    camera.backdrop.add(BackGroundScreen(speed: 100));
        return super.onLoad();
  }
} 