import 'dart:html';
import 'dart:async';

import 'package:vector_math/vector_math.dart';

import 'engine/engine.dart';
import 'input/input.dart';
import 'renderer/renderer.dart';
import 'stage/stages/stage.dart';
import 'stage/stages/stage_zero.dart';

class LilacGame {
  LilacGame(this.canvas) {
    context = canvas.context2D;
    renderer = Renderer(this);
    engine = Engine(this);
    input = Input(this);
  }

  CanvasElement canvas;
  CanvasRenderingContext2D context;
  Input input;
  Renderer renderer;
  Engine engine;
  Stage currentStage;

  void start() {
    //#6495ED
    currentStage = StageZero(this);

    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;
    currentStage.cameraPosition = Vector2(
        -(canvas.width - currentStage.width) / 2,
        -(canvas.height - currentStage.height) / 2);

    currentStage.start();
    engine.start();
    renderer.start();
    input.start();

    renderLoop();
    Timer.periodic(Duration(milliseconds: 20), engineLoop);

    window.onResize.listen((Event e) => resizeCanvas());
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

  void resizeCanvas() {
    int widthChange = window.innerWidth - canvas.width;
    int heightChange = window.innerHeight - canvas.height;
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;

    currentStage.cameraPosition -= Vector2(widthChange / 2, heightChange / 2);
  }
}
