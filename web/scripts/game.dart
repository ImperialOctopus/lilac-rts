import 'package:stagexl/stagexl.dart';
import 'package:vector_math/vector_math.dart';
import 'lavendar/engine.dart';
import 'lavendar/entities/entity.dart';
import 'lavendar/entities/unit.dart';
import 'lavendar/target.dart';
import 'renderer/renderer.dart';
import 'unit_select.dart';

class Game {
  static double deltaTime;
  static Stage stage;
  static Engine engine;
  static Renderer renderer;
  static UnitSelect unitSelect;

  Game(_stage) {
    stage = _stage;
  }

  void start() {
    engine = new Engine();
    unitSelect = new UnitSelect();
    renderer = new Renderer();

    stage.onEnterFrame.listen(update);
    stage.onMouseDown.listen(unitSelect.startDrag);
    stage.onMouseUp.listen(unitSelect.stopDrag);
    stage.onMouseRightDown.listen(unitSelect.setMoveTarget);

    createUnit(new Vector2(50, 75), Team.Friendly);
    createUnit(new Vector2(100, 200), Team.Friendly);
    createUnit(new Vector2(200, 50), Team.Friendly);
    createUnit(new Vector2(250, 125), Team.Friendly);
    createUnit(new Vector2(600, 500), Team.Enemy);
    createUnit(new Vector2(500, 400), Team.Enemy);
    createUnit(new Vector2(450, 500), Team.Enemy);
  }

  void update(EnterFrameEvent f) {
    deltaTime = f.passedTime;
    engine.update();

    renderer.renderEntities();
    renderer.renderSelection();
  }

  void createUnit(Vector2 position, Team team) {
    Entity unit = engine.createUnit(position, team);
    renderer.addUnit(unit);
  }

  void submitOrder(Set<Unit> units, Target target, TargetType type) {}
}
