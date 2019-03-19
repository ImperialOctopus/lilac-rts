import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';

void main() {
  var canvas = html.querySelector('#stage');
  var stage = new Stage(canvas);
  var renderLoop = new RenderLoop();
  renderLoop.addStage(stage);

  var shape = new Shape();
  shape.graphics.circle(100, 100, 100);
  shape.graphics.fillColor(Color.CornflowerBlue);
  stage.addChild(shape);

  var shape2 = new Shape();
  shape2.graphics.circle(100, 100, 50);
  shape2.graphics.fillColor(Color.White);
  stage.addChild(shape2);
}
