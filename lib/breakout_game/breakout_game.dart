import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:interesting_breakout_game/breakout_game/components/ball.dart';
import 'package:interesting_breakout_game/breakout_game/components/brick.dart';
import 'package:interesting_breakout_game/breakout_game/components/play_area.dart';
import 'package:interesting_breakout_game/breakout_game/enums/brick_type.dart';
import 'package:interesting_breakout_game/breakout_game/configs.dart';
import 'dart:math' as math;

class BreakoutGame extends FlameGame with PanDetector, HasCollisionDetection {
  final rand = math.Random();
  double get width => size.x;
  double get height => size.y;

  @override
  Color backgroundColor() => const Color(0xfff2e8cf);

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    // debugMode = true;
    camera = CameraComponent.withFixedResolution(
      width: gameWidth,
      height: gameHeight,
    );
    camera.viewfinder.anchor = Anchor.topLeft;

    await world.add(PlayArea());

    await world.addAll([
      for (var i = 0; i < brickColumnLength / 2; i++)
        for (var j = 0; j < brickRowLength; j++)
          Brick(
            position: Vector2(i * brickWidth, j * brickHeight),
            type: BrickType.dark,
          ),
    ]);
    await world.addAll([
      for (var i = brickColumnLength / 2; i < brickColumnLength; i++)
        for (var j = 0; j < brickRowLength; j++)
          Brick(
            position: Vector2(i * brickWidth, j * brickHeight),
            type: BrickType.light,
          ),
    ]);

    await world.add(
      Ball(
        velocity: Vector2(rand.nextDouble() * -1, rand.nextDouble() * -1)
            .normalized(),
        position: Vector2(gameWidth * 0.25, gameHeight * 0.75),
        breakableBrickType: BrickType.light,
      ),
    );
    await world.add(
      Ball(
        velocity: Vector2(rand.nextDouble(), rand.nextDouble()).normalized(),
        position: Vector2(gameWidth * 0.75, gameHeight * 0.25),
        breakableBrickType: BrickType.dark,
      ),
    );
  }
}
