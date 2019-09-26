import 'dart:html';
import 'dart:math';

import 'package:vector_math/vector_math.dart';

import '../lilac_game.dart';
import '../stage/units/unit.dart';

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
  }

  void start() {
    game.context.canvas.onMouseDown.listen(mouseDown);
    game.context.canvas.onMouseUp.listen(mouseUp);
    game.context.canvas.onContextMenu
        .listen((MouseEvent e) => e.preventDefault());
    game.context.canvas.onMouseMove.listen((MouseEvent e) {
      mousePosition = Vector2(e.offset.x, e.offset.y);
    });
    game.context.canvas.onMouseLeave.listen(stopDrag);
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
      u.moveTarget =
          Vector2(e.offset.x, e.offset.y) + game.currentStage.cameraPosition;
    }
  }

  void setFireTarget(MouseEvent e) {
    for (Unit u in selectedUnits) {
      u.fireTarget =
          Vector2(e.offset.x, e.offset.y) + game.currentStage.cameraPosition;
    }
  }

  void select() {
    Rectangle selection = Rectangle.fromPoints(
        Point(position1.x + game.currentStage.cameraPosition.x,
            position1.y + game.currentStage.cameraPosition.y),
        Point(position2.x + game.currentStage.cameraPosition.x,
            position2.y + game.currentStage.cameraPosition.y));

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
