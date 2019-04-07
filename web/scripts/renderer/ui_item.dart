import 'package:stagexl/stagexl.dart';

import '../game.dart';

class UIItem {
  Shape shape;

  UIItem() {
    shape = new Shape();
  }

  void update() {}

  void destroy() {
    shape.removeFromParent();
    Game.renderer.renderableUI.remove(this);
  }
}
