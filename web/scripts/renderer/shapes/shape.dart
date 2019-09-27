import 'package:vector_math/vector_math.dart';

import '../../stage/game_objects/game_object.dart';

abstract class Shape {
  GameObject parent;
  Vector2 offset;

  Shape(this.parent, {this.offset});

  void render();
}
