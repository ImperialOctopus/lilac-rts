import 'dart:html';

import 'package:vector_math/vector_math.dart';

import 'input/keyboard.dart';
import 'lavendar/renderer.dart';
import 'lilac/engine.dart';
import 'lilac/entities/entity.dart';
import 'lilac/time.dart';

class Game {
  static CanvasRenderingContext2D ctx;

  Keyboard keyboard;
  Renderer renderer;

  static final int stageHeight = 600;
  static final int stageWidth = 600;

  Game(_ctx) {
    ctx = _ctx;
  }

  void start() {
    Engine.load(stageHeight, stageWidth);

    keyboard = new Keyboard();
    renderer = new Renderer(ctx, Engine.allEntities);

    keyboard.addBinding(KeyCode.P, () => {Time.pause()});
    keyboard.addBinding(KeyCode.O, () => {Time.speedUp()});
    keyboard.addBinding(KeyCode.I, () => {Time.speedDown()});

    Engine.createUnit(new Vector2(50, 50), Team.Friendly);
    Engine.createUnit(new Vector2(50, 100), Team.Friendly);
    Engine.createUnit(new Vector2(100, 50), Team.Friendly);
    Engine.createUnit(new Vector2(100, 100), Team.Friendly);
    Engine.createUnit(new Vector2(500, 500), Team.Enemy);
    Engine.createUnit(new Vector2(500, 550), Team.Enemy);
    Engine.createUnit(new Vector2(550, 500), Team.Enemy);
    Engine.createUnit(new Vector2(550, 550), Team.Enemy);

    Engine.start();
    renderer.start();
  }
}
