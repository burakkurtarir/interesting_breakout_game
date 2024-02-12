import 'package:flutter/material.dart';

enum BrickType {
  dark(Color.fromRGBO(9, 38, 53, 1)),
  light(Color.fromRGBO(158, 200, 185, 1));

  final Color color;

  const BrickType(this.color);

  BrickType get reverse => switch (this) {
        BrickType.dark => BrickType.light,
        BrickType.light => BrickType.dark,
      };
}
