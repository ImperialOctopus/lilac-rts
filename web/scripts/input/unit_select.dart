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

    //// Set up event listeners
    //   Mouse
    Game.stage.onMouseDown.listen(startDrag);
    Game.stage.onMouseUp.listen(stopDrag);
    Game.stage.onMouseRightDown.listen(setMoveTarget);
    Game.stage.onMouseMiddleDown.listen(setFireTarget);

    var clientRect = ctx.canvas.getBoundingClientRect();

    ctx.canvas.on.click.add((e) {
      var x = e.clientX - clientRect.left;
      var y = e.clientY - clientRect.top;
    });
  }

  void startDrag(InputEvent e) {
    position1 = new Vector2(e.stageX.clamp(0, Game.stageWidth),
        e.stageY.clamp(0, Game.stageHeight));
    selecting = true;
  }

  void stopDrag(InputEvent e) {
    position2 = new Vector2(e.stageX.clamp(0, Game.stageWidth),
        e.stageY.clamp(0, Game.stageHeight));
    selecting = false;
    select();
  }

  void setMoveTarget(InputEvent e) {
    for (Unit u in selectedUnits) {
      u.setMoveTarget(new Vector2(e.stageX, e.stageY));
    }
  }

  void setFireTarget(InputEvent e) {
    for (Unit u in selectedUnits) {
      u.setFireTarget(new Vector2(e.stageX, e.stageY));
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