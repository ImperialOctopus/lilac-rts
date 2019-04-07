import 'package:vector_math/vector_math.dart';

import 'entities/entity.dart';
import 'entities/unit.dart';

class Engine {
  List<Entity> entities;
  List<Unit> units;

  Engine() {
    units = new List<Unit>();
    entities = new List<Entity>();
  }

  void start() {}

  void update() {
    for (var item in entities) {
      item.update();
    }
  }

  Entity createUnit(Vector2 position, Team team) {
    Unit u = new Unit(position, team);
    entities.add(u);
    units.add(u);
    return u;
  }

  static Vector2 clampVector(Vector2 vector, double magnitude) {
    if (vector.length2 > magnitude * magnitude) {
      return vector.normalized() * magnitude;
    } else {
      return vector;
    }
  }
}
