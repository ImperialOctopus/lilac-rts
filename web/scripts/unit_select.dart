import 'package:stagexl/stagexl.dart';
import 'package:vector_math/vector_math.dart';
import 'game.dart';
import 'lavendar/entities/unit.dart';

class UnitSelect {
  List<Unit> allUnits;
  List<Unit> selectedUnits;

  Vector2 position1;
  Vector2 position2;
  bool selecting;
  Shape shape;

  UnitSelect(this.allUnits) {
    shape = new Shape();
    selecting = false;
    Game.stage..onMouseDown.listen(startDrag)..onMouseUp.listen(stopDrag);
  }

  void startDrag(InputEvent e) {
    position1 = new Vector2(e.stageX, e.stageY);
    selecting = true;
  }

  void stopDrag(InputEvent e) {
    position2 = new Vector2(e.stageX, e.stageY);
    shape.graphics.clear();
    select();
    selecting = false;
  }

  void select() {
    num left = position1.x < position2.x ? position1.x : position2.x;
    num top = position1.y < position2.y ? position1.y : position2.y;
    num width = (position1.x - position2.x).abs();
    num height = (position1.y - position2.y).abs();
    Rectangle selection = Rectangle(left, top, width, height);

    selectedUnits = new List<Unit>();
    for (var unit in allUnits) {
      if (unit.team == 0) {
        if (selection.contains(unit.position.x, unit.position.y)) {
          selectedUnits.add(unit);
        }
      }
    }
  }
}
