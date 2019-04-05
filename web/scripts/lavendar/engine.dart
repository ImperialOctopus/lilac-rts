import 'package:vector_math/vector_math.dart';

import 'entities/entity.dart';
import 'entities/unit.dart';

class Engine {
  static List<Entity> entities;
  static List<Unit> units;

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

  void createUnit(Vector2 position) {
    Unit u = new Unit(position);
    entities.add(u);
    units.add(u);
  }
}
