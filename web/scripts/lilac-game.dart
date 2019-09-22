import 'dart:html';
import 'dart:async';

import 'engine/engine.dart';
import 'input/input.dart';
import 'renderer/renderer.dart';
import 'stage/stage.dart';

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
    currentStage = Stage(600, 600, "#6495ED");

    engine.start();
    renderer.start();
    input.start();

    renderLoop();
    Timer.periodic(Duration(milliseconds: 100), engineLoop);
  }

  Future<void> renderLoop() async {
    while (true) {
      await window.animationFrame;
      await renderer.render(currentStage);
    }
  }

  void engineLoop(Timer t) {
    engine.update(currentStage);
  }
}
