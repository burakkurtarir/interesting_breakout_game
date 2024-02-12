import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:interesting_breakout_game/breakout_game/breakout_game.dart';
import 'package:interesting_breakout_game/breakout_game/enums/brick_type.dart';
import 'package:interesting_breakout_game/breakout_game/configs.dart';

class Brick extends RectangleComponent
    with CollisionCallbacks, HasGameRef<BreakoutGame> {
  Brick({
    required this.type,
    required super.position,
  }) : super(
          paint: Paint()..color = type.color,
          size: Vector2(brickWidth, brickHeight),
          children: [RectangleHitbox()],
        );

  BrickType type;
}
