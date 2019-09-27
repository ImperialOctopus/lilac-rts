import 'package:vector_math/vector_math.dart';

import '../../stage/game_objects/game_object.dart';
import 'shape.dart';

class ShapeRectangle implements Shape {
  GameObject parent;
  Vector2 offset;

  Vector2 size;
  String colour;

  ShapeRectangle(this.parent, this.size, this.colour, {this.offset}) {
    offset ??= Vector2.zero();
  }

  @override
  void render() {
    Vector2 position = parent.position + offset + parent.stage.cameraOffset;
    parent.stage.game.context
      ..fillStyle = colour
      ..fillRect(position.x, position.y, size.x, size.y);
  }
}
