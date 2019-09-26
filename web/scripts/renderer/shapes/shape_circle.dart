import 'dart:html';
import 'dart:math';

import 'package:vector_math/vector_math.dart';

import '../../stage/game_object.dart';
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
  void render(CanvasRenderingContext2D context) {
    Vector2 position = parent.position + offset + parent.stage.cameraOffset;
    context
      ..beginPath()
      ..arc(position.x, position.y, radius, 0, 2 * pi)
      ..fillStyle = colour
      ..fill();
  }
}
