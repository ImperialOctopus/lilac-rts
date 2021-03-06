import 'dart:math';

import 'package:vector_math/vector_math.dart';

import '../../stage/game_objects/game_object.dart';
import 'shape.dart';

class ShapeCircle implements Shape {
  GameObject parent;
  Vector2 offset;

  int radius;
  String colour;

  ShapeCircle(this.parent, this.radius, this.colour, {this.offset}) {
    offset ??= Vector2.zero();
  }

  @override
  void render() {
    Vector2 position = parent.position + offset + parent.stage.cameraOffset;
    parent.stage.game.context
      ..beginPath()
      ..arc(position.x, position.y, radius, 0, 2 * pi)
      ..fillStyle = colour
      ..fill();
  }
}
