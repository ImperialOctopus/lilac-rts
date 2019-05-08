import 'dart:html';

import 'package:vector_math/vector_math.dart';

import 'input/keyboard.dart';
import 'lavendar/renderer.dart';
import 'lilac/engine.dart';
import 'lilac/entities/entity.dart';
import 'lilac/time.dart';

class Game {
  Engine engine;
  Keyboard keyboard;
  Renderer renderer;

  static final int stageHeight = 600;
  static final int stageWidth = 600;

  Game() {}

  void start() {
    keyboard = new Keyboard();
    engine = new Engine(stageHeight, stageWidth);
    renderer = new Renderer(engine.stream.streamController.stream);

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

  void update() {
    engine.update();
  }
}
