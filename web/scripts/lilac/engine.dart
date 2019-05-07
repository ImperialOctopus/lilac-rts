import 'package:vector_math/vector_math.dart';
import 'ai/ai.dart';
import 'entities/entity.dart';
import 'entities/projectile.dart';
import 'entities/unit.dart';
import 'event_stream.dart';

class Engine {
  AI ai;
  EventStream stream;

  Engine() {
    Entity.all = new List<Entity>();
    Unit.all = new List<Unit>();
    Projectile.all = new List<Projectile>();
    ai = new AI();
    stream = new EventStream();
  }

  void update() {
    for (var e in Entity.all) {
      e.update();
    }
    ai.update();
  }

  createUnit(Vector2 position, Team team) {
    stream.add(new Unit(position, team));
  }

  createProjectile(Vector2 position, Vector2 velocity, Team team) {
    stream.add(new Projectile(position, velocity, team));
  }
}
