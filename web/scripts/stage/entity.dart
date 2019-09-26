import 'package:vector_math/vector_math.dart';
import '../engine/collision/collider.dart';
import '../renderer/shapes/shape.dart';
import 'game_object.dart';
import 'stages/stage.dart';

class Entity implements GameObject {
  Vector2 position;
  Stage stage;

  Vector2 velocity;

  Entity(this.position, this.velocity);

  @override
  void update(double timeScale) {}

  @override
  void destroy() {}

  @override
  List<Shape> renderShapes() {
    return null;
  }

  @override
  Collider collider() {
    return null;
  }
}
