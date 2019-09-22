import 'package:vector_math/vector_math.dart';

import 'game-object.dart';
import 'unit.dart';

class Projectile implements GameObject {
  static List<Projectile> all;

  Projectile(Vector2 position, Vector2 velocity, Team team);

  void update(double timeScale) {}

  void render() {}
}
