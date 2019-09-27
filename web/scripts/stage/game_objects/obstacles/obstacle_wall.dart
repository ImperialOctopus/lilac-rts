import 'package:vector_math/vector_math.dart';

import '../../../engine/collision/collider.dart';
import '../../../engine/collision/collider_line.dart';
import '../../../renderer/shapes/shape.dart';
import '../../../renderer/shapes/shape_line.dart';
import 'obstacle.dart';

class ObstacleWall extends Obstacle {
  int thickness;
  String colour;
  Vector2 end;

  ObstacleWall(Vector2 position, this.end,
      {this.thickness = 3, this.colour = "#000000"})
      : super(position);

  Vector2 get direction {
    return (end - position).normalized();
  }

  double get length {
    return position.distanceTo(end);
  }

  @override
  List<Shape> get renderShapes {
    return [
      ShapeLine(this, direction, length, thickness: thickness, colour: colour)
    ];
  }

  @override
  Collider get collider {
    return ColliderLine(this, direction, length);
  }
}
