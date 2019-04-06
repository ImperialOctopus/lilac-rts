import 'package:stagexl/stagexl.dart';
import 'package:vector_math/vector_math.dart';
import 'lavendar/engine.dart';
import 'lavendar/entities/unit.dart';
import 'lavendar/target.dart';
import 'renderer.dart';
import 'unit_select.dart';

class Game {
  static Stage stage;
  static double deltaTime;
  Engine engine;
  Renderer renderer;
  UnitSelect unitSelect;

  Game(Stage _stage) {
    stage = _stage;
  }

  void start() {
    engine = new Engine();
    renderer = new Renderer();
    unitSelect = new UnitSelect(engine.units);

    stage.onEnterFrame.listen(update);

    createUnit(new Vector2(200, 100));
    createUnit(new Vector2(450, 150));
    createUnit(new Vector2(100, 300));
    createUnit(new Vector2(350, 200));
  }

  void update(EnterFrameEvent f) {
    deltaTime = f.passedTime;
    engine.update();

    renderer.renderEntities(engine.entities);
    renderer.renderSelection(unitSelect);
    renderer.renderMenu();
  }

  void createUnit(Vector2 position) {
    engine.createUnit(position);
  }

  void submitOrder(Set<Unit> units, Target target, TargetType type) {}
}
