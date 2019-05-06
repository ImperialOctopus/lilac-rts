import 'package:stagexl/stagexl.dart';

class UI {
  static List<UI> all;
  Sprite sprite;

  UI() {
    sprite = new Sprite();
    all.add(this);
  }

  void update() {}

  void destroy() {
    sprite.removeFromParent();
    all.remove(this);
  }
}
