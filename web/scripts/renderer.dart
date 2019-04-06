import 'package:stagexl/stagexl.dart';

import 'lavendar/entities/entity.dart';
import 'unit_select.dart';

class Renderer {
  Renderer() {}

  void renderEntities(List<Entity> entities) {
    for (Entity entity in entities) {
      Shape shape = borderedCircle(Color.Black, Color.Orange, 10);
    }
  }

  void renderSelection(UnitSelect unitSelect) {
    shape.graphics.clear();
    shape.graphics
      ..beginPath()
      ..rect(position1.x, position1.y, position2.x - position1.x,
          position2.y - position1.y)
      ..closePath()
      ..fillColor(Color.White);
    Game.stage.addChild(shape);

    if (selecting) {
      position2 = new Vector2(Game.stage.mouseX, Game.stage.mouseY);
    }
  }

  void renderMenu() {}

  Shape borderedCircle(fill, border, r) {
    Shape shape = new Shape();
    shape.graphics
      ..beginPath()
      ..circle(0, 0, r)
      ..closePath()
      ..fillColor(border);
    shape.graphics
      ..beginPath()
      ..circle(0, 0, r / 2)
      ..closePath()
      ..fillColor(fill);
    return shape;
  }
}
