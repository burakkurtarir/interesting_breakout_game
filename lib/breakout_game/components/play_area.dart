import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:interesting_breakout_game/breakout_game/breakout_game.dart';

class PlayArea extends RectangleComponent with HasGameRef<BreakoutGame> {
  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    paint = Paint()..color = const Color(0xfff2e8cf);
    size = Vector2(game.width, game.height);
    add(RectangleHitbox());
  }
}
