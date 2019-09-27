import 'package:vector_math/vector_math.dart';

import '../../stages/stage.dart';
import '../game_object.dart';

class Entity extends GameObject {
  Vector2 position;
  Stage stage;

  Vector2 velocity;

  Entity(this.position, this.velocity);

  @override
  void update() {}

  @override
  void destroy() {
    stage.removeEntity(this);
  }
}
