import 'package:vector_math/vector_math.dart';

import '../../../renderer/shapes/shape.dart';
import '../../../renderer/shapes/shape_rectangle.dart';
import 'ghost.dart';

class GhostBuilding extends Ghost {
  Vector2 size;
  String colour;

  GhostBuilding(Vector2 position, this.size, this.colour) : super(position);

  @override
  List<Shape> get renderShapes {
    return [ShapeRectangle(this, size, colour)];
  }
}
