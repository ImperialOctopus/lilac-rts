import 'package:vector_math/vector_math.dart';

import '../renderer/shapes/shape.dart';

abstract class GameObject {
  Vector2 position;

  void update(double timeScale);
  List<Shape> renderShapes();
}
