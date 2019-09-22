import 'dart:html';
import 'dart:math';

import 'package:vector_math/vector_math.dart';

import '../lilac-game.dart';
import '../stage/unit.dart';

class UnitSelect {
  LilacGame game;
  List<Unit> selectedUnits;
  Vector2 position1;
  Vector2 position2;
  Vector2 mousePosition;
  bool selecting;

  UnitSelect(this.game) {
    selectedUnits = List<Unit>();
    selecting = false;

    game.context.canvas.onMouseDown.listen(mouseDown);
    game.context.canvas.onMouseUp.listen(mouseUp);
    game.context.canvas.onContextMenu
        .listen((MouseEvent e) => e.preventDefault());
    game.context.canvas.onMouseMove.listen((MouseEvent e) {
      mousePosition = Vector2(e.offset.x, e.offset.y);
    });
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
      u.setMoveTarget(Vector2(e.offset.x, e.offset.y));
    }
  }

  void setFireTarget(MouseEvent e) {
    for (Unit u in selectedUnits) {
      u.setFireTarget(Vector2(e.offset.x, e.offset.y));
    }
  }

  void select() {
    Rectangle selection = Rectangle.fromPoints(
        Point(position1.x, position1.y), Point(position2.x, position2.y));

    selectedUnits.clear();
    for (var unit in game.currentStage.units) {
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
