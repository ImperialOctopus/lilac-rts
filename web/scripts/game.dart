import 'dart:html';

import 'package:stagexl/stagexl.dart';
import 'package:vector_math/vector_math.dart';
import 'keyboard.dart';
import 'lavendar/engine.dart';
import 'lavendar/entities/entity.dart';
import 'lavendar/time.dart';
import 'renderer/menu/menu.dart';
import 'renderer/renderer.dart';
import 'unit_select.dart';

const int stageHeight = 600;
const int stageWidth = 600;
const int backgroundColor = Color.White;
const int foregroundColor = Color.CornflowerBlue;

class Game {
  static double deltaTime;

  static Stage stage;
  static ResourceManager resourceManager;

  static Menu menu;
  static Engine engine;
  static Renderer renderer;
  static UnitSelect unitSelect;
  static Keyboard keyboard;

  Game(_stage, _resourceManager) {
    stage = _stage;
    resourceManager = _resourceManager;
  }

  void load() {
    renderer = new Renderer();
    keyboard = new Keyboard();

    resourceManager
      ..addBitmapData('menu_play', 'assets/menu/play.png')
      ..addBitmapData('ui_move', 'assets/ui/move.png')
      ..addBitmapData('ui_attack', 'assets/ui/attack.png');
    resourceManager.load().then((r) => {startMenu()});
  }

  void startMenu() {
    menu = new Menu();
  }

  void startGame() {
    engine = new Engine();
    unitSelect = new UnitSelect();

    stage.onEnterFrame.listen(update);
    engine.stream.streamController.stream.listen((e) => entityCreated(e));

    keyboard.addBinding(KeyCode.P, () => {Time.pause()});
    keyboard.addBinding(KeyCode.O, () => {Time.speedUp()});
    keyboard.addBinding(KeyCode.I, () => {Time.speedDown()});

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
