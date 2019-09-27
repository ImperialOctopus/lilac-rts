import 'package:vector_math/vector_math.dart';

import '../../stage/game_objects/game_object.dart';
import 'shape.dart';

class ShapeLine implements Shape {
  GameObject parent;
  Vector2 offset;

  Vector2 direction;
  double length;
  int thickness;
  String colour;

  ShapeLine(this.parent, this.direction, this.length,
      {this.thickness = 2, this.colour = "#000000", this.offset}) {
    offset ??= Vector2.zero();
  }

  @override
  void render() {
    Vector2 start = parent.position + offset + parent.stage.cameraOffset;
    Vector2 end = start + direction.normalized().scaled(length);

    parent.stage.game.context
      ..beginPath()
      ..lineWidth = thickness
      ..strokeStyle = colour
      ..moveTo(start.x, start.y)
      ..lineTo(end.x, end.y)
      ..closePath()
      ..stroke();
  }
}
