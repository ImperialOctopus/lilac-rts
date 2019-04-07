import 'package:stagexl/stagexl.dart';

import '../game.dart';
import '../lavendar/entities/unit.dart';
import 'renderable_entity.dart';
import 'renderer.dart';

class RenderableUnit extends RenderableEntity {
  Unit unit;

  RenderableUnit(this.unit) : super(unit);

  void updateImage() {
    shape.graphics.clear();
    if (unit.team == Team.Friendly) {
      if (Game.unitSelect.selectedUnits.contains(unit)) {
        // Selected friendly
        shape = Renderer.borderedCircle(Color.Black, Color.Orange, 10);
      } else {
        // Unselected friendly
        shape = Renderer.borderedCircle(Color.Black, Color.Yellow, 10);
      }
    } else if (unit.team == Team.Enemy) {
      // Enemy
      shape = Renderer.borderedCircle(Color.White, Color.Red, 10);
    }
  }
}