import 'dart:html';
import 'dart:async';

import 'package:vector_math/vector_math.dart';

import 'engine/ai/ai_random_move.dart';
import 'engine/engine.dart';
import 'input/input.dart';
import 'renderer/renderer.dart';
import 'stage/stage.dart';
import 'stage/units/unit.dart';

class LilacGame {
  LilacGame(this.context) {
    renderer = Renderer(this);
    engine = Engine(this);
    input = Input(this);
  }

  CanvasRenderingContext2D context;
  Input input;
  Renderer renderer;
  Engine engine;
  Stage currentStage;

  void start() {
    //#6495ED
    currentStage = Stage(600, 600, "#EEEEEE", this);
    currentStage.addUnit(Unit(Vector2(50, 50), Team.Friendly));
    currentStage.addUnit(Unit(Vector2(100, 50), Team.Friendly));
    currentStage
        .addUnit(Unit(Vector2(100, 100), Team.Enemy, ai: AIRandomMove()));

    engine.start();
    renderer.start();
    input.start();

    renderLoop();
    Timer.periodic(Duration(milliseconds: 20), engineLoop);
  }

  Future<void> renderLoop() async {
    while (true) {
      await window.animationFrame;
      await input.update();
      await renderer.render(currentStage);
    }
  }

  void engineLoop(Timer t) {
    engine.update(currentStage);
  }
}
