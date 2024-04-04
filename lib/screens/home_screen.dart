
import 'dart:developer';

import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends FlameGame with KeyboardEvents {
  static const _size = 100.0;
  final paint = Paint()..color = Colors.blue;

  static const double _speed = 100.0;
  static const double _friction = 0.9;

  Vector2 _position = Vector2.zero();
  Vector2 _movementVector = Vector2.zero();

  bool isPressingRight = false;
  bool isPressingLeft = false;
  bool isPressingUp = false;
  bool isPressingDown = false;

 

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final rect = Rect.fromLTWH(_position.x, _position.y, _size, _size);
    canvas.drawRect(rect, paint);
  }

  @override
  void update(double dt) {
    super.update(dt);
    final Vector2 inputVector = Vector2.zero();
    if (isPressingLeft) {
      inputVector.x -= 1.0;
    }
    else if (isPressingRight) {
      inputVector.x += 1.0;
    }
    if (isPressingUp) {
      inputVector.y -= 1.0;
    } 
     else if (isPressingDown) {
      inputVector.y += 1.0;
    }

    if(!inputVector.isZero()){
      _movementVector=inputVector;
      _movementVector.normalize();
      _movementVector *=_speed * dt;
    }else{
      _movementVector *=_friction;
    }
    _position +=_movementVector;
    // log(_position.toString());
  }

  @override
  KeyEventResult onKeyEvent(
      KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
        log(keysPressed.toString());
    if (keysPressed.contains(LogicalKeyboardKey.keyA) &&
        event is KeyDownEvent) {
      isPressingLeft = true;
    } else if (event is KeyDownEvent &&
        event.logicalKey != LogicalKeyboardKey.keyA) {
      isPressingLeft = false;
    }
    if (keysPressed.contains(LogicalKeyboardKey.keyD) &&
        event is KeyDownEvent) {
      isPressingRight = true;
    } else if (event is KeyDownEvent &&
        event.logicalKey != LogicalKeyboardKey.keyD) {
      isPressingRight = false;
    }
    if (keysPressed.contains(LogicalKeyboardKey.keyW) &&
        event is KeyDownEvent) {
      isPressingUp = true;
    } else if (event is KeyDownEvent &&
        event.logicalKey != LogicalKeyboardKey.keyW) {
      isPressingUp = false;
    }
    if (keysPressed.contains(LogicalKeyboardKey.keyS) &&
        event is KeyDownEvent) {
      isPressingDown = true;
    } else if (event is KeyDownEvent &&
        event.logicalKey != LogicalKeyboardKey.keyS) {
      isPressingDown = false;
    }
    return KeyEventResult.handled;
  }
}
