import 'package:stagexl/stagexl.dart';

class Unit {
  Stage stage;
  Sprite sprite;
  Point position;

  // Constructor, with syntactic sugar for assignment to members.
  Unit(this.stage, this.position) {
    this.addToStage();
  }

  void addToStage() {
    Shape shape = new Shape();
    shape.graphics
      ..beginPath()
      ..circle(0, 0, 10)
      ..closePath()
      ..fillColor(Color.Orange);
    shape.graphics
      ..beginPath()
      ..circle(0, 0, 6)
      ..closePath()
      ..fillColor(Color.Black);

    sprite = new Sprite()
      ..addChild(shape)
      ..x = position.x
      ..y = position.y;

    stage.addChild(sprite);
  }
}
