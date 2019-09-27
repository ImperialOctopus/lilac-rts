import 'dart:html';
import 'dart:async';

import 'package:pedantic/pedantic.dart';
import 'package:vector_math/vector_math.dart';

import 'engine/engine.dart';
import 'input/input.dart';
import 'menu/menus/menu.dart';
import 'menu/menus/menu_main.dart';
import 'menu/menus/menu_null.dart';
import 'renderer/renderer.dart';
import 'stage/stages/stage.dart';
import 'stage/stages/stage_null.dart';

class LilacGame {
  LilacGame(this.canvas) {
    context = canvas.context2D;
    renderer = Renderer(this);
    engine = Engine(this);
    input = Input(this);

    nullStage = StageNull(this);
    nullMenu = MenuNull(this);
  }

  CanvasElement canvas;
  CanvasRenderingContext2D context;
  Input input;
  Renderer renderer;
  Engine engine;
  Stage stage;
  Menu menu;

  Stage nullStage;
  Menu nullMenu;

  void start() async {
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;

    await engine.start();
    await renderer.start();
    await input.start();

    unloadStage();
    await loadMenu(MenuMain(this));

    unawaited(renderLoop());
    Timer.periodic(Duration(milliseconds: 20), engineLoop);
    window.onResize.listen((Event e) => resizeCanvas());
  }

  Future<void> loadStage(Stage newStage) async {
    stage = newStage;
    await stage.start();
  }

  Future<void> loadMenu(Menu newMenu) async {
    menu = newMenu;
    await menu.start();
  }

  void unloadStage() {
    stage = nullStage;
  }

  void unloadMenu() {
    menu = nullMenu;
  }

  Future<void> renderLoop() async {
    while (true) {
      await window.animationFrame;
      await input.update();
      await menu.update();
      await renderer.render(stage, menu);
    }
  }

  void engineLoop(Timer t) {
    engine.update(stage);
  }

  void resizeCanvas() {
    int widthChange = window.innerWidth - canvas.width;
    int heightChange = window.innerHeight - canvas.height;
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;

    stage?.cameraPosition -= Vector2(widthChange / 2, heightChange / 2);
  }
}
