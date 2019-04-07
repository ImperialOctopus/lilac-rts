import 'package:stagexl/stagexl.dart';

import '../game.dart';
import '../lavendar/entities/entity.dart';
import '../lavendar/entities/unit.dart';
import 'renderable_entity.dart';
import 'renderer.dart';

class RenderableUnit extends RenderableEntity {
  Unit unit;

  RenderableUnit(this.unit) : super(unit) {
    sprite.onMouseClick.listen(onClick);
  }

  void updateImage() {
    sprite.graphics.clear();
    Shape shape;
    if (unit.team == Team.Friendly) {
      if (Game.userInput.selectedUnits.contains(unit)) {
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
    sprite.addChild(shape);
  }

  void onClick(InputEvent e) {
    Game.userInput.selectUnit(unit);
  }

  void destroy(e) {
    Game.renderer.renderableUnits.remove(this);
    super.destroy(e);
  }
}
