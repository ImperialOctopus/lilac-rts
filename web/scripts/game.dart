import 'dart:html';

import 'package:vector_math/vector_math.dart';

import 'input/keyboard.dart';
import 'input/unit_select.dart';
import 'lavendar/renderer.dart';
import 'lilac/engine.dart';
import 'lilac/entities/entity.dart';
import 'lilac/time.dart';

class Game {
  static CanvasElement canvas;

  Keyboard keyboard;
  UnitSelect unitSelect;
  Renderer renderer;

  Game(_canvas) {
    canvas = _canvas;
  }

  void start() {
    Engine.load();

    keyboard = new Keyboard();
    unitSelect = new UnitSelect();
    renderer = new Renderer(canvas, Engine.allEntities, unitSelect);

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

  static int canvasSize() {
    if (canvas.width > canvas.height) {
      return canvas.height;
    } else {
      return canvas.width;
    }
  }

  static Vector2 canvasOffset() {
    if (canvas.width > canvas.height) {
      return new Vector2((canvas.width - canvas.height) / 2, 0);
    } else {
      return new Vector2(0, (canvas.height - canvas.width) / 2);
    }
  }

  static double renderScale() {
    return canvasSize() / Engine.stageSize;
  }

  static Vector2 worldToStage(Vector2 world) {
    Vector2 offset = canvasOffset();
    double scale = renderScale();
    return new Vector2(
        (world.x - offset.x) / scale, (world.y - offset.y) / scale);
  }

  static Vector2 stageToWorld(Vector2 stage) {
    Vector2 offset = canvasOffset();
    double scale = renderScale();
    return new Vector2(
        (stage.x * scale) + offset.x, (stage.y * scale) + offset.y);
  }

  static Point v2Point(Vector2 v) {
    return Point(v.x, v.y);
  }
}
