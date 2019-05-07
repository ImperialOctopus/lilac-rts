import 'dart:html' hide Point;
import 'package:pixi/pixi.dart';

Loader loader;

main() {
  Application app = new Application(
      new Options(height: 256, width: 256, backgroundColor: 0x061639));
  document.body.append(app.view);

  Sprite sprite;

  loader = new Loader();
  loader
    ..add('menu_play', "assets/menu/play.png")
    ..load((loader, resources) =>
        {sprite = new Sprite(resources.menu_play.texture)});
}
