import 'dart:html';

import 'package:vector_math/vector_math.dart';

import 'menu.dart';
import 'menu_item.dart';

class MenuItemBox extends MenuItem {
  int height;
  int width;
  String strokeColour;
  int strokeWidth;
  String fillColour;

  MenuItemBox(Menu menu, Vector2 position, this.width, this.height,
      {this.strokeColour = "#FFFFFF",
      this.strokeWidth = 2,
      this.fillColour,
      Rectangle clickArea,
      Function clickFunction})
      : super(menu, position,
            clickArea: clickArea, clickFunction: clickFunction);

  @override
  Future<void> start() async {}

  @override
  void render(CanvasRenderingContext2D context) {
    menu.game.context
      ..beginPath()
      ..rect(position.x, position.y, width, height);
    if (strokeWidth > 0) {
      menu.game.context
        ..strokeStyle = strokeColour
        ..lineWidth = strokeWidth
        ..stroke();
    }
    if (fillColour != null) {
      menu.game.context
        ..fillStyle = fillColour
        ..fill();
    }
  }
}
