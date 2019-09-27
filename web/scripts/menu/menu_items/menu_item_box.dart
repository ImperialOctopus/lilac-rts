import 'dart:html';

import 'package:vector_math/vector_math.dart';

import '../menus/menu.dart';
import 'menu_item.dart';

class MenuItemBox extends MenuItem {
  Vector2 size;
  String strokeColour;
  int strokeWidth;
  String fillColour;

  MenuItemBox(Menu menu, Vector2 position, this.size,
      {this.strokeColour = "#FFFFFF",
      this.strokeWidth = 2,
      this.fillColour,
      Alignment alignment,
      Rectangle clickArea,
      Function clickFunction})
      : super(menu, position,
            alignment: alignment,
            clickArea: clickArea,
            clickFunction: clickFunction);

  @override
  Future<void> start() async {}

  @override
  void render(CanvasRenderingContext2D context) {
    menu.game.context
      ..beginPath()
      ..rect(alignedPosition.x, alignedPosition.y, size.x, size.y);
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
