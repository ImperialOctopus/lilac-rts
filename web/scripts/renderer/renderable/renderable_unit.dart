import 'package:stagexl/stagexl.dart';

import '../../game.dart';
import '../../lavendar/entities/entity.dart';
import '../../lavendar/entities/unit.dart';
import '../renderer.dart';
import '../ui/ui_reload.dart';
import 'renderable.dart';

class RenderableUnit extends Renderable {
  Unit unit;
  UIReload uiReload;

  RenderableUnit(this.unit) : super(unit) {
    sprite.onMouseClick.listen(onClick);
    if (unit.team == Team.Friendly) {
      uiReload = new UIReload(unit);
    }
  }

  void loadImage() {
    sprite.graphics.clear();
    Shape shape;
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
    sprite.addChild(shape);
  }

  void update() {
    super.update();
  }

  void onClick(InputEvent e) {
    Game.unitSelect.selectUnit(unit);
  }

  void destroy(e) {
    Renderable.all.remove(this);
    if (uiReload != null) {
      uiReload.destroy();
    }
    super.destroy(e);
  }
}
