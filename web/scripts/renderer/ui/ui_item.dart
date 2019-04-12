import 'package:stagexl/stagexl.dart';

class UIItem {
  static List<UIItem> all;
  Shape shape;

  UIItem() {
    shape = new Shape();
    all.add(this);
  }

  void update() {}

  void destroy() {
    shape.removeFromParent();
    all.remove(this);
  }
}
