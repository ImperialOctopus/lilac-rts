import 'package:vector_math/vector_math.dart';

import '../collision.dart';
import '../engine.dart';
import 'entity.dart';
import 'unit.dart';

class Projectile extends Entity {
  static List<Projectile> all;

  Projectile(Vector2 position, Vector2 velocity, Team team)
      : super(position, velocity, team) {
    all.add(this);
    this.entityType = EntityType.Projectile;
  }

  void update() {
    super.update();
  }

  void move() {
    super.move();
    if (!Collision.pointWithinRectangle(
        Vector2.zero(),
        new Vector2(Engine.stageWidth as double, Engine.stageHeight as double),
        position)) {
      destroy();
    }
  }

  void collision() {
    for (Unit unit in Unit.all) {
      if (unit.team != team) {
        if (Collision.circlePoint(unit.circle(), this.position)) {
          unit.projectileHit();
          destroy();
        }
      }
    }
  }

  void destroy() {
    Projectile.all.remove(this);
    super.destroy();
  }
}
