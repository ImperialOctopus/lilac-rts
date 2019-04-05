import 'package:stagexl/stagexl.dart';
import 'package:vector_math/vector_math.dart';
import 'lavendar/engine.dart';
import 'lavendar/entities/unit.dart';
import 'lavendar/target.dart';
import 'renderer.dart';
import 'unit_select.dart';

class Game {
  Stage stage;
  Game(this.stage) {}

  void start() {
    Engine e = new Engine();
    Renderer r = new Renderer(stage);
    UnitSelect u = new UnitSelect(stage, allUnits);

    createUnit(new Vector2(200, 100));
    createUnit(new Vector2(450, 150));
    createUnit(new Vector2(100, 300));
    createUnit(new Vector2(350, 200));
  }

  void createUnit(Vector2 position) {}
  void submitOrder(Set<Unit> units, Target target, TargetType type) {}
}
