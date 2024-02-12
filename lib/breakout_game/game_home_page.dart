import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:interesting_breakout_game/breakout_game/breakout_game.dart';
import 'package:interesting_breakout_game/breakout_game/configs.dart';

class GameHomePage extends StatelessWidget {
  const GameHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final breakoutGame = BreakoutGame();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffa9d6e5),
              Color(0xfff2e8cf),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: SizedBox(
              width: gameWidth,
              height: gameHeight,
              child: GameWidget.controlled(
                gameFactory: () => breakoutGame,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
