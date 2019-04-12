import 'package:stagexl/stagexl.dart';

class UI {
  static List<UI> all;
  Shape shape;

  UI() {
    shape = new Shape();
    all.add(this);
  }

  void update() {}

  void destroy() {
    shape.removeFromParent();
    all.remove(this);
  }
}
