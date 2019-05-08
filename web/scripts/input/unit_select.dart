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
  Vector2 mousePosition;
  bool selecting;

  UnitSelect() {
    selectedUnits = new List<Unit>();
    selecting = false;

    Game.canvas.onMouseDown.listen(mouseDown);
    Game.canvas.onMouseUp.listen(mouseUp);
    Game.canvas.onContextMenu.listen((MouseEvent e) => e.preventDefault());
    Game.canvas.onMouseMove.listen((MouseEvent e) =>
        {mousePosition = new Vector2(e.offset.x, e.offset.y)});
  }

  void mouseDown(MouseEvent e) {
    // Left click
    if (e.button == 0) {
      startDrag(e);
    }
    // Right click
    else if (e.button == 2) {
      if (e.ctrlKey) {
        setFireTarget(e);
      } else {
        setMoveTarget(e);
      }
    } // Middle click
    else if (e.button == 1) {
      setFireTarget(e);
    }
  }

  void mouseUp(MouseEvent e) {
    if (e.button == 0) {
      stopDrag(e);
    }
  }

  void startDrag(MouseEvent e) {
    position1 = mousePosition;

    selecting = true;
  }

  void stopDrag(MouseEvent e) {
    position2 = mousePosition;
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

    selectedUnits.clear();
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
