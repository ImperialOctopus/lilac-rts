import 'dart:async';
import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';

import 'scripts/game.dart';

Future<Null> main() async {
  StageOptions stageOptions = new StageOptions()
    ..backgroundColor = backgroundColor
    ..renderEngine = RenderEngine.WebGL
    ..inputEventMode = InputEventMode.MouseAndTouch;

  html.Element canvas = html.querySelector('#stage');
  Stage stage = new Stage(canvas,
      width: stageHeight, height: stageWidth, options: stageOptions);
  RenderLoop renderLoop = new RenderLoop();
  renderLoop.addStage(stage);
  ResourceManager resourceManager = new ResourceManager();
  resourceManager 
    ..addBitmapData('menu_play', 'assets/menu/play.png')
    ..addBitmapData('ui_move', 'assets/ui/move.png')
    ..addBitmapData('ui_attack', 'assets/ui/attack.png');
  await resourceManager.load();

  Game game = new Game(stage);
  game.start();
}
