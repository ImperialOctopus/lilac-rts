import 'dart:html';

import 'package:vector_math/vector_math.dart';

import 'menu.dart';

class MenuItem {
  Menu menu;
  Vector2 position;

  Rectangle clickArea;
  Function clickFunction;

  MenuItem(this.menu, this.position, {this.clickArea, this.clickFunction});

  Future<void> start() async {}

  void render(CanvasRenderingContext2D context) {}

  void checkClick(Point point) {
    Point localPoint = Point(point.x - position.x, point.y - position.y);
    if (clickArea != null && clickFunction != null) {
      if (clickArea.containsPoint(localPoint)) {
        clickFunction();
      }
    }
  }
}
