import 'package:vector_math/vector_math.dart';

import '../../stage/game_objects/game_object.dart';
import 'collider_circle.dart';

abstract class Collider {
  GameObject parent;
  Vector2 offset;

  Collider(this.parent, {this.offset});

  Vector2 get center;

  bool intersectsCircle(ColliderCircle collider);

  Vector2 reaction(ColliderCircle collider);
}
