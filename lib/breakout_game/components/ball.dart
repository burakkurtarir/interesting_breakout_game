import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:interesting_breakout_game/breakout_game/breakout_game.dart';
import 'package:interesting_breakout_game/breakout_game/components/brick.dart';
import 'package:interesting_breakout_game/breakout_game/components/play_area.dart';
import 'package:interesting_breakout_game/breakout_game/enums/brick_type.dart';
import 'package:interesting_breakout_game/breakout_game/configs.dart';

class Ball extends CircleComponent
    with CollisionCallbacks, HasGameRef<BreakoutGame> {
  Ball({
    required this.breakableBrickType,
    required this.velocity,
    required super.position,
  }) : super(
          radius: ballRadius,
          anchor: Anchor.center,
          paint: Paint()
            ..color = breakableBrickType.color
            ..style = PaintingStyle.fill,
          children: [CircleHitbox()],
        );

  Vector2 velocity;
  final BrickType breakableBrickType;
  final double speed = 500;

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt * speed;
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);

    switch (other) {
      case PlayArea():
        if (intersectionPoints.first.y <= 0) {
          velocity.y = -velocity.y;
        } else if (intersectionPoints.first.x <= 0) {
          velocity.x = -velocity.x;
        } else if (intersectionPoints.first.x >= game.width) {
          velocity.x = -velocity.x;
        } else if (intersectionPoints.first.y >= game.height) {
          velocity.y = -velocity.y;
        }
        break;
      case Brick():
        if (other.type == breakableBrickType) {
          // final normalVector = intersectionPoints.first.normalized();
          // velocity = velocity.reflected(-normalVector);

          other.type = breakableBrickType.reverse;
          other.paint.color = breakableBrickType.reverse.color;

          if (position.y < other.position.y - other.size.y / 2) {
            velocity.y = -velocity.y;
          } else if (position.y > other.position.y + other.size.y / 2) {
            velocity.y = -velocity.y;
          } else if (position.x < other.position.x) {
            velocity.x = -velocity.x;
          } else if (position.x > other.position.x) {
            velocity.x = -velocity.x;
          }
        }
        break;
      default:
    }
  }
}
