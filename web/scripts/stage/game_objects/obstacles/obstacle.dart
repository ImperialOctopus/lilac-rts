import 'package:vector_math/vector_math.dart';

import '../../stages/stage.dart';
import '../game_object.dart';

class Obstacle extends GameObject {
  Vector2 position;
  Stage stage;

  Obstacle(this.position);

  @override
  void destroy() {
    stage.removeObstacle(this);
  }
}
