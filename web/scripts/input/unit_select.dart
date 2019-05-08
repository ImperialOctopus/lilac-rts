import 'dart:html';
import 'dart:math';

import 'package:vector_math/vector_math.dart';

import '../game.dart';
import '../lilac/entities/entity.dart';
import '../lilac/entities/unit.dart';

class UnitSelect {
  List<Unit> selectedUnits;
  Vector2 position1;
  Vector2 position2;
  bool selecting;

  UnitSelect() {
    selectedUnits = new List<Unit>();
    selecting = false;

    Game.ctx.canvas.onMouseDown.listen(mouseDown);
  }

  void mouseDown(MouseEvent e) {
    print(e);
  }

  void startDrag(MouseEvent e) {
    position1 = new Vector2(e.offset.x.clamp(0, Game.stageWidth),
        e.offset.y.clamp(0, Game.stageHeight));
    selecting = true;
  }

  void stopDrag(MouseEvent e) {
    position2 = new Vector2(e.offset.x.clamp(0, Game.stageWidth),
        e.offset.y.clamp(0, Game.stageHeight));
    selecting = false;
    select();
  }

  void setMoveTarget(MouseEvent e) {
    for (Unit u in selectedUnits) {
      u.setMoveTarget(new Vector2(e.offset.x, e.offset.y));
    }
  }

  void setFireTarget(MouseEvent e) {
    for (Unit u in selectedUnits) {
      u.setFireTarget(new Vector2(e.offset.x, e.offset.y));
    }
  }

  void select() {
    Rectangle selection = Rectangle.fromPoints(
        Point(position1.x, position1.y), Point(position2.x, position2.y));

    selectedUnits = new List<Unit>();
    for (var unit in Unit.all) {
      if (unit.team == Team.Friendly) {
        if (selection.containsPoint(Point(unit.position.x, unit.position.y))) {
          selectedUnits.add(unit);
        }
      }
    }
  }

  void selectUnit(Unit u) {
    selectedUnits.clear();
    selectedUnits.add(u);
  }
}
