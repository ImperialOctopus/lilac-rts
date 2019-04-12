import 'dart:html' as HTML;

import 'package:stagexl/stagexl.dart';
import 'package:vector_math/vector_math.dart';
import 'game.dart';
import 'lavendar/entities/entity.dart';
import 'lavendar/entities/unit.dart';
import 'lavendar/time.dart';

class UserInput {
  List<Unit> selectedUnits;

  Vector2 position1;
  Vector2 position2;
  bool selecting;

  UserInput() {
    selectedUnits = new List<Unit>();
    selecting = false;

    //// Set up event listeners
    //   Mouse
    Game.stage.onMouseDown.listen(startDrag);
    Game.stage.onMouseUp.listen(stopDrag);
    Game.stage.onMouseRightDown.listen(setMoveTarget);
    Game.stage.onMouseMiddleDown.listen(setFireTarget);
    //   Keyboard
    HTML.window.onKeyDown.listen(keyDown);
  }

  void startDrag(InputEvent e) {
    position1 = new Vector2(
        e.stageX.clamp(0, stageWidth), e.stageY.clamp(0, stageHeight));
    selecting = true;
  }

  void stopDrag(InputEvent e) {
    position2 = new Vector2(
        e.stageX.clamp(0, stageWidth), e.stageY.clamp(0, stageHeight));
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

  void keyDown(HTML.KeyboardEvent e) {
    switch (e.keyCode) {
      case 80: // P
        {
          Time.pause();
          break;
        }
      case 79: // O
        {
          Time.speedUp();
          break;
        }
      case 73: // I
        {
          Time.speedDown();
          break;
        }
    }
  }

  void select() {
    num left = position1.x < position2.x ? position1.x : position2.x;
    num top = position1.y < position2.y ? position1.y : position2.y;
    num width = (position1.x - position2.x).abs();
    num height = (position1.y - position2.y).abs();
    Rectangle selection = Rectangle(left, top, width, height);

    selectedUnits = new List<Unit>();
    for (var unit in Unit.all) {
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
