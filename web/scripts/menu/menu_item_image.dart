import 'dart:html';

import 'package:vector_math/vector_math.dart';

import 'menu.dart';
import 'menu_item.dart';

class MenuItemImage extends MenuItem {
  int height;
  int width;
  ImageElement image;

  MenuItemImage(
      Menu menu, Vector2 position, String imageSource, this.width, this.height,
      {Rectangle clickArea, Function clickFunction})
      : super(menu, position,
            clickArea: clickArea, clickFunction: clickFunction) {
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
        image, Rectangle(position.x, position.y, width, height));
  }
}
