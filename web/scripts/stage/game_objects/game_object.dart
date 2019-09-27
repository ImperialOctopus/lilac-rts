import 'package:vector_math/vector_math.dart';

import '../../engine/collision/collider.dart';
import '../../renderer/shapes/shape.dart';
import '../stages/stage.dart';

class GameObject {
  Vector2 position;
  Stage stage;

  void start() {}

  void update() {}

  void render() {
    for (Shape shape in renderShapes) {
      shape.render();
    }
  }

  void destroy() {}

  List<Shape> get renderShapes {
    return null;
  }

  Collider get collider {
    return null;
  }
}
