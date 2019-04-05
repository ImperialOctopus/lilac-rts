import 'package:stagexl/stagexl.dart';

class Entity {
  shape;
  image;

  static Stage stage;
  Sprite sprite;
  Point<num> position;
  static num radius = 10;

  Entity(this.position) {
    
  }

  void setImage(Sprite s) {
    sprite = s;
    stage.addChild(sprite);
  }
  void render(RenderEvent e) {
    sprite
      ..x = position.x
      ..y = position.y;
  }
}
