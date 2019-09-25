import 'package:vector_math/vector_math.dart';

import '../renderer/shape.dart';
import 'game_object.dart';
import 'stage.dart';

class Entity implements GameObject {
  Vector2 position;
  Vector2 velocity;
  Stage stage;

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
