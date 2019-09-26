import 'dart:html';
import 'dart:math';

import 'package:vector_math/vector_math.dart';

import 'shape.dart';

class ShapeCircle implements Shape {
  int radius;
  String color;

  ShapeCircle(this.radius, this.color);

  void render(CanvasRenderingContext2D context, Vector2 position) {
    context
      ..beginPath()
      ..arc(position.x, position.y, radius, 0, 2 * pi)
      ..fillStyle = color
      ..fill();
  }
}
