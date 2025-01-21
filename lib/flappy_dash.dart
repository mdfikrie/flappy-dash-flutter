import 'dart:async';
import 'dart:math';
import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_dash/components/dash.dart';
import 'package:flappy_dash/components/dash_parallax_background.dart';
import 'package:flappy_dash/components/pipe.dart';
import 'package:flappy_dash/components/pipe_pair.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlappyGameDash extends FlameGame<FlappyGameWorld> with KeyboardEvents {
  FlappyGameDash()
      : super(
          world: FlappyGameWorld(),
          camera: CameraComponent.withFixedResolution(
            width: 600,
            height: 1000,
          ),
        );

  @override
  KeyEventResult onKeyEvent(
      KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (keysPressed.contains(LogicalKeyboardKey.space) == true) {
      world.onSpaceDown();
    }

    return super.onKeyEvent(event, keysPressed);
  }
}

class FlappyGameWorld extends World with TapCallbacks {
  late Dash _dash;
  @override
  FutureOr<void> onLoad() async {
    add(DashParallax());
    add(_dash = Dash());
    _generatePipe(fromX: 400, count: 3);
    return super.onLoad();
  }

  void _generatePipe({
    int count = 5,
    double fromX = 0.0,
    double distance = 350.0,
  }) {
    for (var i = 0; i < count; i++) {
      double area = 600.0;
      add(
        PipePair(
          position: Vector2(fromX + (i * distance),
              (Random().nextDouble() * area) - area / 2),
        ),
      );
    }
  }

  @override
  void onTapDown(TapDownEvent event) {
    _dash.jump();
  }

  void onSpaceDown() {
    _dash.jump();
  }
}
