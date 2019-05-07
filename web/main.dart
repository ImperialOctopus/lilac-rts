import 'dart:html' hide Point;
import 'package:pixi/pixi.dart';

main() {
  Application app = new Application(
      new Options(height: 256, width: 256, backgroundColor: 0x061639));

  document.body.append(app.view);
}
