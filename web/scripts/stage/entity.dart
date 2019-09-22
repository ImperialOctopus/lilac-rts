import 'package:vector_math/vector_math.dart';

import 'game-object.dart';

class Entity implements GameObject {
  Vector2 velocity;
  Vector2 position;
  int mass;

  Entity(this.position, this.velocity);

  void update(double timeScale) {}

  void render() {
    // TODO: implement render
  }
}
