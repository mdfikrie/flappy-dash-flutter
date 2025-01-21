import 'package:flame/game.dart';
import 'package:flappy_dash/flappy_dash.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(
        game: FlappyGameDash(),
      ),
    );
  }
}
