import 'dart:html';

import 'package:vector_math/vector_math.dart';

import '../lilac_game.dart';

class Mouse {
  static const String lineColour = "#000000";
  static const int lineThickness = 2;

  LilacGame game;

  Vector2 mousePosition;

  Mouse(this.game);

  void start() {
    game.context.canvas.onMouseDown.listen(mouseDown);
    game.context.canvas.onMouseUp.listen(mouseUp);
    game.context.canvas.onContextMenu
        .listen((MouseEvent e) => e.preventDefault());
    game.context.canvas.onMouseMove.listen((MouseEvent e) {
      mousePosition = Vector2(e.offset.x, e.offset.y);
    });
    game.context.canvas.onMouseLeave.listen(mouseUp);
  }

  void mouseDown(MouseEvent e) {
    if (game.menu != null) {
      game.menu.mouseDown(e);
    }
    if (game.stage != null) {
      game.stage.mouseDown(e);
    }
  }

  void mouseUp(MouseEvent e) {
    if (game.menu != null) {
      game.menu.mouseUp(e);
    }
    if (game.stage != null) {
      game.stage.mouseUp(e);
    }
  }
}
