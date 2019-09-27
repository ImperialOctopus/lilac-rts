import 'dart:html';

import 'package:vector_math/vector_math.dart';

import '../menus/menu.dart';
import 'menu_item.dart';

class MenuItemImage extends MenuItem {
  ImageElement image;

  MenuItemImage(Menu menu, Vector2 position, Vector2 size, String imageSource,
      {Alignment alignment, Rectangle clickArea, Function clickFunction})
      : super(menu, position, size,
            alignment: alignment,
            clickArea: clickArea,
            clickFunction: clickFunction) {
    image = ImageElement();
    image.src = imageSource;
  }

  @override
  Future<void> start() async {
    await image.onLoad.first;
  }

  @override
  void render(CanvasRenderingContext2D context) {
    context.drawImageToRect(
        image, Rectangle(alignedPosition.x, alignedPosition.y, size.x, size.y));
  }
}
