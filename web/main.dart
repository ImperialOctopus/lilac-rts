import 'dart:async';
import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';
import 'scripts/unit.dart';
import 'scripts/unit_select.dart';

Set<Unit> allUnits;
Set<Unit> selectedUnits;

Future<Null> main() async {
  allUnits = new Set<Unit>();
  selectedUnits = new Set<Unit>();

  StageOptions stageOptions = new StageOptions()
    ..backgroundColor = Color.CornflowerBlue
    ..renderEngine = RenderEngine.WebGL
    ..inputEventMode = InputEventMode.MouseAndTouch;

  html.Element canvas = html.querySelector('#stage');
  Stage stage =
      new Stage(canvas, width: 600, height: 600, options: stageOptions);
  RenderLoop renderLoop = new RenderLoop();
  renderLoop.addStage(stage);
  ResourceManager resourceManager = new ResourceManager();
  await resourceManager.load();

  Unit.selectedUnits = selectedUnits;
  Unit.stage = stage;
  UnitSelect u = new UnitSelect(stage, allUnits);

  Unit a1 = new Unit(Point(200, 100));
  Unit a2 = new Unit(Point(450, 150));
  Unit a3 = new Unit(Point(100, 300));
  Unit a4 = new Unit(Point(350, 200));

  allUnits..add(a1)..add(a2)..add(a3)..add(a4);
}
