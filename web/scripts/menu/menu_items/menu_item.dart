import 'dart:html';

import 'package:vector_math/vector_math.dart';

import '../menus/menu.dart';

enum Alignment { TopLeft, BottomLeft, TopRight, BottomRight }

class MenuItem {
  Menu menu;
  Vector2 position;
  Alignment alignment;

  Rectangle clickArea;
  Function clickFunction;

  MenuItem(this.menu, this.position,
      {this.alignment = Alignment.TopLeft, this.clickArea, this.clickFunction});

  Vector2 get alignedPosition {
    double x = position.x;
    double y = position.y;
    switch (alignment) {
      case Alignment.TopLeft:
        break;
      case Alignment.TopRight:
        x += menu.game.canvas.width;
        break;
      case Alignment.BottomLeft:
        y += menu.game.canvas.height;
        break;
      case Alignment.BottomRight:
        x += menu.game.canvas.width;
        y += menu.game.canvas.height;
        break;
      default:
    }
    return Vector2(x, y);
  }

  Future<void> start() async {}

  void update() {}

  void render(CanvasRenderingContext2D context) {}

  void checkClick(Point point) {
    Point localPoint =
        Point(point.x - alignedPosition.x, point.y - alignedPosition.y);
    if (clickArea != null && clickFunction != null) {
      if (clickArea.containsPoint(localPoint)) {
        clickFunction();
      }
    }
  }
}
