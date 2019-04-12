import 'package:vector_math/vector_math.dart';

import '../../game.dart';
import '../renderer.dart';
import 'ui_item.dart';

class UIBackground extends UIItem {
  UIBackground() : super() {
    shape = Renderer.rectangle(
        new Vector2(0, 0),
        new Vector2(stageWidth as double, stageHeight as double),
        foregroundColor);
    Game.stage.addChild(shape);
  }

  void update() {}
}
