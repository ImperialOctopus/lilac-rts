import 'dart:html';

import 'package:stagexl/stagexl.dart';
import 'package:vector_math/vector_math.dart';
import 'lavendar/engine.dart';
import 'lavendar/entities/entity.dart';
import 'renderer/renderer.dart';
import 'user_input.dart';

const int stageHeight = 600;
const int stageWidth = 600;
const int backgroundColor = Color.White;
const int foregroundColor = Color.CornflowerBlue;

class Game {
  static double deltaTime;
  static Stage stage;
  static Engine engine;
  static Renderer renderer;
  static UserInput userInput;

  Game(_stage) {
    stage = _stage;
  }

  void start() {
    engine = new Engine();
    userInput = new UserInput();
    renderer = new Renderer();

    stage.onEnterFrame.listen(update);
    engine.stream.streamController.stream.listen((e) => entityCreated(e));

    engine.createUnit(new Vector2(50, 50), Team.Friendly);
    engine.createUnit(new Vector2(50, 100), Team.Friendly);
    engine.createUnit(new Vector2(100, 50), Team.Friendly);
    engine.createUnit(new Vector2(100, 100), Team.Friendly);
    engine.createUnit(new Vector2(500, 500), Team.Enemy);
    engine.createUnit(new Vector2(500, 550), Team.Enemy);
    engine.createUnit(new Vector2(550, 500), Team.Enemy);
    engine.createUnit(new Vector2(550, 550), Team.Enemy);
  }

  void update(EnterFrameEvent f) {
    deltaTime = f.passedTime;
    engine.update();
    renderer.update();
  }

  void entityCreated(CustomEvent event) {
    Entity entity = event.detail;
    switch (entity.entityType) {
      case EntityType.Unit:
        renderer.addUnit(entity);
        break;
      case EntityType.Projectile:
        renderer.addProjectile(entity);
        break;
    }
  }
}
