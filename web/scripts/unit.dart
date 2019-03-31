import 'package:stagexl/stagexl.dart';

class Unit {
  Stage stage;
  Sprite sprite;
  num x;
  num y;

  // Constructor, with syntactic sugar for assignment to members.
  Unit(this.stage, x, y) {
    this.addToStage();
  }

  void addToStage() {
    var shape = new Shape();
    shape.graphics.circle(100, 100, 60);
    shape.graphics.fillColor(Color.Red);
    shape.graphics.circle(60, 60, 30);
    shape.graphics.fillColor(Color.Orange);

    sprite = new Sprite();
    sprite.addChild(shape);
    sprite.x = x;
    sprite.y = y;
    sprite.addTo(stage);

    sprite.onMouseDown.listen(startDrag);
    sprite.onTouchBegin.listen(startDrag);
    sprite.onMouseUp.listen(stopDrag);
    sprite.onTouchEnd.listen(stopDrag);
    stage.onMouseLeave.listen(stopDrag);
  }

  void startDrag(Event e) {
    stage.addChild(sprite);
    //sprite.scaleX = sprite.scaleY = 1.2;
    sprite.filters.add(new ColorMatrixFilter.adjust(hue: -0.5));
    sprite.startDrag(true);
  }

  void stopDrag(Event e) {
    //sprite.scaleX = sprite.scaleY = 1.0;
    sprite.filters.clear();
    sprite.stopDrag();
  }
}
