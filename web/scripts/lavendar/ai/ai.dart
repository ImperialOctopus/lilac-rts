import 'dart:math';

import 'package:vector_math/vector_math.dart';

import '../../game.dart';
import '../entities/entity.dart';
import '../entities/unit.dart';

class AI {
  List<Unit> allUnits;
  List<Unit> team;
  List<Unit> nonTeam;

  Random random;

  AI(this.allUnits) {
    random = new Random();
  }

  update() {
    team = new List<Unit>();
    nonTeam = new List<Unit>();

    for (Unit unit in allUnits) {
      if (unit.team == Team.Enemy) {
        team.add(unit);
      } else {
        nonTeam.add(unit);
      }
    }

    for (Unit unit in team) {
      if (!unit.moveTarget.isSet) {
        setRandomMoveTarget(unit);
      }
      if (!unit.fireTarget.isSet) {
        setClosestFireTarget(unit);
      }
    }
  }

  void setRandomMoveTarget(Unit unit) {
    unit.setMoveTarget(new Vector2(random.nextInt(stageWidth) as double,
        random.nextInt(stageHeight) as double));
  }

  void setClosestFireTarget(Unit unit) {
    Unit closest;
    double distance = double.infinity;
    for (Unit enemy in nonTeam) {
      double d = unit.position.distanceToSquared(enemy.position);
      if (d < distance) {
        closest = enemy;
        distance = d;
      }
    }
    if (closest != null) {
      unit.setFireTarget(closest.position);
    }
  }
}