import 'dart:html';

import 'package:vector_math/vector_math.dart';

abstract class Shape {
  void render(CanvasRenderingContext2D context, Vector2 position);
}
