import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flappy_dash/components/pipe.dart';

class PipePair extends PositionComponent {
  final double gap;
  PipePair({
    required super.position,
    this.gap = 100.0,
    this.speed = 200.0,
  });

  final double speed;

  @override
  FutureOr<void> onLoad() async {
    addAll([
      Pipe(isFlipped: false, position: Vector2(0, gap)),
      Pipe(isFlipped: true, position: Vector2(0, -gap)),
    ]);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    position.x -= speed * dt;
    super.update(dt);
  }
}
