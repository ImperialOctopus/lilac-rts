import 'package:vector_math/vector_math.dart';

import '../renderer/shape.dart';
import 'game_object.dart';
import 'stage.dart';

class Obstacle implements GameObject {
  Vector2 position;
  Stage stage;

  Obstacle(this.position);

  void update(double timeScale) {
    // TODO: implement update
  }

  List<Shape> renderShapes() {
    // TODO: implement renderShapes
    return null;
  }
}
