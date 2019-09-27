import 'package:vector_math/vector_math.dart';

import '../../engine/collision/collider.dart';
import '../../renderer/shapes/shape.dart';
import '../game_object.dart';
import '../stages/stage.dart';

class Obstacle implements GameObject {
  Vector2 position;
  Stage stage;

  Obstacle(this.position);

  void update() {}

  @override
  List<Shape> renderShapes() {
    return null;
  }

  @override
  Collider collider() {
    return null;
  }

  @override
  void destroy() {
    stage.removeObstacle(this);
  }
}
