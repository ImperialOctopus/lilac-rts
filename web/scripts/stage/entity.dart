import 'package:vector_math/vector_math.dart';

import '../renderer/shape.dart';
import 'game_object.dart';

class Entity implements GameObject {
  Vector2 velocity;
  Vector2 position;

  Entity(this.position, this.velocity);

  void update(double timeScale) {}

  void render(Vector2 offset, double scale) {
    // TODO: implement render
  }

  List<Shape> renderShapes() {
    // TODO: implement renderShapes
    return null;
  }
}
