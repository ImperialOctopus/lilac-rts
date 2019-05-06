import 'package:stagexl/stagexl.dart';
import 'package:vector_math/vector_math.dart';

import '../../game.dart';
import '../renderer.dart';
import 'ui.dart';

class UISelection extends UI {
  UISelection() : super();

  void update() {
    shape.graphics.clear();
    if (Game.unitSelect.selecting) {
      Vector2 mouse = new Vector2(Game.stage.mouseX, Game.stage.mouseY);
      mouse.clampScalar(0, 600);
      shape = Renderer.borderedRectangle(
          Game.unitSelect.position1, mouse, Color.White);
    }
  }
}
