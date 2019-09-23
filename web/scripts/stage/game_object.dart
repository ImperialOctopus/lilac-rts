import 'package:vector_math/vector_math.dart';

import '../renderer/shape.dart';

abstract class GameObject {
  Vector2 position;

  void update(double timeScale);
  List<Shape> renderShapes();
}
