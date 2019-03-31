import 'dart:async';
import 'dart:math' as math;
import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';
import 'scripts/unit.dart';

Future main() async {
  // configure StageXL default options.

  StageXL.stageOptions.renderEngine = RenderEngine.WebGL;
  StageXL.stageOptions.inputEventMode = InputEventMode.MouseAndTouch;
  StageXL.stageOptions.backgroundColor = Color.CornflowerBlue;

  // init Stage and RenderLoop

  var canvas = html.querySelector('#stage');
  var stage = new Stage(canvas, width: 600, height: 600);
  var renderLoop = new RenderLoop();
  renderLoop.addStage(stage);

  // load resources

  var resourceManager = new ResourceManager();
  resourceManager.addBitmapData("flowers", "assets/images/flowers.png");
  await resourceManager.load();

  var a = new Unit(stage, 100, 100);
}
