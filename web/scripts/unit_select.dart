import 'package:stagexl/stagexl.dart';
import 'package:vector_math/vector_math.dart';

import 'game.dart';

class UnitSelect {
  Shape shape;

  Vector2 position1;
  Vector2 position2;
  bool selecting;

  UnitSelect() {
    shape = new Shape();
    selecting = false;
    Game.stage
      ..onMouseDown.listen(startDrag)
      ..onTouchBegin.listen(startDrag)
      ..onMouseUp.listen(stopDrag)
      ..onTouchEnd.listen(stopDrag);
  }

  void startDrag(InputEvent e) {
    position1 = new Point(e.stageX, e.stageY);
    selecting = true;
  }

  void stopDrag(InputEvent e) {
    position2 = new Point(e.stageX, e.stageY);
    shape.graphics.clear();
    select();
    selecting = false;
  }

  void select() {
    num left = position1.x < position2.x ? position1.x : position2.x;
    num top = position1.y < position2.y ? position1.y : position2.y;
    num width = (position1.x - position2.x).abs();
    num height = (position1.y - position2.y).abs();
    Rectangle r = Rectangle(left, top, width, height);
    for (var unit in allUnits) {
      if (r.contains(unit.position.x, unit.position.y)) {
        unit.select();
      } else {
        unit.deselect();
      }
    }
  }

  void update(EnterFrameEvent e) {
    if (selecting) {
      stage.mousePosition;
      position2 = stage.mousePosition;
      draw();
    }
  }

  void draw() {
    shape.graphics.clear();
    shape.graphics
      ..beginPath()
      ..rect(position1.x, position1.y, position2.x - position1.x,
          position2.y - position1.y)
      ..closePath()
      ..fillColor(Color.White);
    stage.addChild(shape);
  }
}
