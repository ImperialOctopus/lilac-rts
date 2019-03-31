import 'package:stagexl/stagexl.dart';
import 'unit.dart';

class UnitSelect {
  Stage stage;
  Shape shape;

  Point position1;
  Point position2;
  bool selecting;

  Set<Unit> allUnits;
  Set<Unit> selectedUnits;

  UnitSelect(this.stage, this.allUnits) {
    shape = new Shape();
    selecting = false;
    stage
      ..onMouseDown.listen(startDrag)
      ..onTouchBegin.listen(startDrag)
      ..onMouseUp.listen(stopDrag)
      ..onTouchEnd.listen(stopDrag);
    stage.onEnterFrame.listen(update);
  }

  void startDrag(InputEvent e) {
    position1 = new Point(e.stageX, e.stageY);
    selecting = true;
  }

  void stopDrag(InputEvent e) {
    position1 = new Point(e.stageX, e.stageY);
    shape.graphics.clear();
    select();
    selecting = false;
  }

  void select() {
    selectedUnits = new Set<Unit>();
    Rectangle r = Rectangle(position1.x, position1.y, position2.x - position1.x,
        position2.y - position1.y);
    for (var unit in allUnits) {
      if (r.contains(unit.position.x, unit.position.y)) {
        selectedUnits.add(unit);
      }
    }
    print(selectedUnits);
  }

  void update(EnterFrameEvent e) {
    if (selecting) {
      stage.mousePosition;
      position2 = stage.mousePosition;

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
}
