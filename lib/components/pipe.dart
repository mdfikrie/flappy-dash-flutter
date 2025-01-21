import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';

class Pipe extends PositionComponent {
  late Sprite _pipeSprite;

  final bool isFlipped;

  Pipe({required this.isFlipped, required super.position});

  @override
  FutureOr<void> onLoad() async {
    _pipeSprite = await Sprite.load('pipe.png');
    anchor = Anchor.topCenter;
    final ratio = _pipeSprite.srcSize.y / _pipeSprite.srcSize.x;
    final width = 100.0;
    size = Vector2(width, width * ratio);
    if (isFlipped) {
      flipVertically();
    }
    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    _pipeSprite.render(canvas, position: Vector2.zero(), size: size);
    super.render(
      canvas,
    );
  }
}
