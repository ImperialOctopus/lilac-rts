import 'package:vector_math/vector_math.dart';

import '../renderer/shape.dart';
import 'game_object.dart';
import 'unit.dart';

class Projectile implements GameObject {
  Vector2 position;
  Vector2 velocity;
  Team team;

  Projectile(this.position, this.velocity, this.team);

  void update(double timeScale) {
    position += velocity * timeScale;
  }

  List<Shape> renderShapes() {
    if (team == Team.Friendly) {
      return [Shape(ShapeType.Circle, 3, "#000000")];
    } else {
      return [Shape(ShapeType.Circle, 3, "#880e4f")];
    }
  }
}
