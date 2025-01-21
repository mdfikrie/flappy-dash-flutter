import 'dart:async';
import 'dart:ui';
import 'package:flame/components.dart';

class Dash extends PositionComponent {
  Dash()
      : super(
          position: Vector2(0, 0),
          size: Vector2.all(80),
          anchor: Anchor.center,
        );

  late Sprite _dashSprite;
  final _gravity = Vector2(0, 900.0);
  var _velocity = Vector2(0, 0);
  final _jumpForce = Vector2(0, -400);

  @override
  FutureOr<void> onLoad() async {
    _dashSprite = await Sprite.load('dash.png');
    return super.onLoad();
  }

  @override
  void update(double dt) {
    _velocity += _gravity * dt;
    position += _velocity * dt;
    super.update(dt);
  }

  void jump() {
    _velocity = _jumpForce;
  }

  @override
  void render(Canvas canvas) {
    _dashSprite.render(canvas, size: size);
    super.render(canvas);
  }
}
