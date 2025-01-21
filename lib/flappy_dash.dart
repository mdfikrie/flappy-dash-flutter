import 'dart:async';
import 'dart:ui';

import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';

class FlappyGameDash extends FlameGame<FlappyGameWorld> {
  FlappyGameDash()
      : super(
          world: FlappyGameWorld(),
          camera: CameraComponent.withFixedResolution(
            width: 600,
            height: 1000,
          ),
        );
}

class FlappyGameWorld extends World {
  @override
  void onLoad() {
    add(Dash());
  }
}

class Dash extends PositionComponent {
  Dash()
      : super(
          position: Vector2(0, 0),
          size: Vector2(20, 20),
        );

  @override
  void render(Canvas canvas) {
    // TODO: implement render
    canvas.drawCircle(Offset(0, 0), 20, BasicPalette.blue.paint());
    super.render(canvas);
  }

  @override
  void update(double dt) {
    position.x += -2;
    position.y += -2;
    super.update(dt);
  }
}
