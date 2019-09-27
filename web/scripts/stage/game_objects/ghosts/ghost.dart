import 'package:vector_math/vector_math.dart';

import '../../stages/stage.dart';
import '../game_object.dart';

class Ghost extends GameObject {
  Vector2 position;
  Stage stage;

  Ghost(this.position);

  @override
  void destroy() {
    stage.removeGhost(this);
  }
}
