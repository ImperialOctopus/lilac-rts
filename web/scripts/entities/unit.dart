import 'package:stagexl/src/geom/point.dart';

import 'entity.dart';

class Unit extends Entity {
  Unit(Point<num> position) : super(position);

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
