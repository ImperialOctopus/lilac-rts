import 'dart:core';
import 'dart:html';

import 'package:vector_math/vector_math.dart';

import '../menus/menu.dart';
import 'menu_item.dart';

class MenuItemButton extends MenuItem {
  bool enabled = false;
  Function enabledFunction;
  ImageElement imageOn;
  ImageElement imageOff;

  MenuItemButton(Menu menu, Vector2 position, Vector2 size,
      String imageSourceOff, String imageSourceOn,
      {Alignment alignment,
      Rectangle clickArea,
      Function clickFunction,
      this.enabledFunction})
      : super(menu, position, size,
            alignment: alignment,
            clickArea: clickArea,
            clickFunction: clickFunction) {
    imageOn = ImageElement();
    imageOn.src = imageSourceOn;
    imageOff = ImageElement();
    imageOff.src = imageSourceOff;
  }

  @override
  Future<void> start() async {
    await imageOn.onLoad.first;
    await imageOff.onLoad.first;
  }

  @override
  void update() {
    if (enabledFunction != null) {
      enabled = enabledFunction();
    }
  }

  @override
  void render() {
    CanvasImageSource source;
    source = enabled ? imageOn : imageOff;
    menu.game.context.drawImageToRect(source,
        Rectangle(alignedPosition.x, alignedPosition.y, size.x, size.y));
  }
}
