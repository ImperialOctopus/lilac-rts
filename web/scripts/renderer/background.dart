import 'package:stagexl/stagexl.dart';
import 'package:vector_math/vector_math.dart';

import '../game.dart';
import 'renderer.dart';

class Background {
  Shape shape;

  Background() {
    shape = Renderer.rectangle(
        new Vector2(0, 0),
        new Vector2(stageWidth as double, stageHeight as double),
        foregroundColor);
    Game.stage.addChildAt(shape, 0);
  }
}
