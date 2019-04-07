import 'package:vector_math/vector_math.dart';

import '../../game.dart';
import '../collision.dart';
import 'entity.dart';
import 'unit.dart';

enum Team { Friendly, Enemy }

class Projectile extends Entity {
  Team team;
  double speed = 3;

  Projectile(Vector2 position, Vector2 velocity, this.team)
      : super(position, velocity) {
    this.entityType = EntityType.Projectile;
  }

  void update() {
    super.update();
  }

  void move() {
    super.move();
  }

  void collision() {
    for (Unit unit in Game.engine.units) {
      if (unit.team != team) {
        if (Collision.circlePoint(unit.circle(), this.position)) {
          print("Hit");
        }
      }
    }
  }
}
