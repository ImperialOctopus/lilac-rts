import 'package:stagexl/stagexl.dart';

class Renderer {
  Stage stage;
  Renderer() {}

  sprite = s;
  stage.addChild(sprite);

  void render(RenderEvent e) {
  sprite
    ..x = position.x
    ..y = position.y;
  }

  Shape borderedCircle(fill, border, r) {
    Shape shape = new Shape();
    shape.graphics
      ..beginPath()
      ..circle(0, 0, r)
      ..closePath()
      ..fillColor(border);
    shape.graphics
      ..beginPath()
      ..circle(0, 0, r / 2)
      ..closePath()
      ..fillColor(fill);
    return shape;
  }
}
