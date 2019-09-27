import 'package:vector_math/vector_math.dart';

import '../engine/collision/collider.dart';
import '../renderer/shapes/shape.dart';
import 'stages/stage.dart';

abstract class GameObject {
  Vector2 position;
  Stage stage;

  void update();
  void destroy();

  List<Shape> renderShapes();
  Collider collider();
}
