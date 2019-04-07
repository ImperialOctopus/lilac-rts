import 'package:stagexl/stagexl.dart';
import 'package:vector_math/vector_math.dart';
import 'game.dart';
import 'lavendar/entities/unit.dart';

class UserInput {
  List<Unit> allUnits;
  List<Unit> selectedUnits;

  Vector2 position1;
  Vector2 position2;
  bool selecting;

  UserInput() {
    allUnits = Game.engine.units;
    selectedUnits = new List<Unit>();
    selecting = false;
  }

  void startDrag(InputEvent e) {
    position1 = new Vector2(e.stageX, e.stageY);
    selecting = true;
  }

  void stopDrag(InputEvent e) {
    position2 = new Vector2(e.stageX, e.stageY);
    selecting = false;
    select();
  }

  void setMoveTarget(InputEvent e) {
    for (Unit u in selectedUnits) {
      u.setMoveTarget(new Vector2(e.stageX, e.stageY));
    }
  }

  void select() {
    num left = position1.x < position2.x ? position1.x : position2.x;
    num top = position1.y < position2.y ? position1.y : position2.y;
    num width = (position1.x - position2.x).abs();
    num height = (position1.y - position2.y).abs();
    Rectangle selection = Rectangle(left, top, width, height);

    selectedUnits = new List<Unit>();
    for (var unit in allUnits) {
      if (unit.team == Team.Friendly) {
        if (selection.contains(unit.position.x, unit.position.y)) {
          selectedUnits.add(unit);
        }
      }
    }
    Game.renderer.updateUnits();
  }

  void selectUnit(Unit u) {
    selectedUnits = new List<Unit>();
    selectedUnits.add(u);
    Game.renderer.updateUnits();
  }
}
