import 'package:stagexl/stagexl.dart';
import 'package:vector_math/vector_math.dart';

import '../game.dart';
import '../lavendar/entities/entity.dart';
import '../lavendar/entities/projectile.dart';
import '../lavendar/entities/unit.dart';
import 'renderable/renderable.dart';
import 'renderable/renderable_projectile.dart';
import 'renderable/renderable_unit.dart';
import 'ui/ui.dart';
import 'background.dart';
import 'ui/ui_framerate.dart';
import 'ui/ui_selection.dart';
import 'ui/ui_timemultiplier.dart';

class Renderer {
  Shape unitSelectShape;

  Renderer() {
    unitSelectShape = new Shape();
    Renderable.all = new List<Renderable>();
    UI.all = new List<UI>();

    new Background();
    new UIFramerate();
    new UITimeMultiplier();
    new UISelection();
  }

  void addUnit(Unit unit) {
    new RenderableUnit(unit);
  }

  void addProjectile(Projectile projectile) {
    new RenderableProjectile(projectile);
  }

  // Update loop

  void update() {
    renderEntities();
    renderUI();
  }

  void renderEntities() {
    for (Renderable r in Renderable.all) {
      r.update();
      Game.stage.addChild(r.sprite);
    }
  }

  void renderUI() {
    for (UI ui in UI.all) {
      ui.update();
      Game.stage.addChild(ui.shape);
    }
  }

  void updateUnits() {
    for (Renderable r in Renderable.all) {
      if (r.entity.entityType == EntityType.Unit) {
        r.loadImage();
      }
    }
  }

  // Static shapes

  static Shape borderedCircle(fill, border, radius) {
    Shape shape = new Shape();
    shape.graphics
      ..beginPath()
      ..circle(0, 0, radius)
      ..closePath()
      ..fillColor(border);
    shape.graphics
      ..beginPath()
      ..circle(0, 0, radius / 2)
      ..closePath()
      ..fillColor(fill);
    return shape;
  }

  static Shape circle(fill, radius) {
    Shape shape = new Shape();
    shape.graphics
      ..beginPath()
      ..circle(0, 0, radius)
      ..closePath()
      ..fillColor(fill);
    return shape;
  }

  static Shape borderedRectangle(
      Vector2 position1, Vector2 position2, int border) {
    Shape shape = new Shape();
    shape.graphics
      ..beginPath()
      ..moveTo(position1.x, position1.y)
      ..lineTo(position1.x, position2.y)
      ..lineTo(position2.x, position2.y)
      ..lineTo(position2.x, position1.y)
      ..lineTo(position1.x, position1.y)
      ..closePath()
      ..strokeColor(border);
    return shape;
  }

  static Shape rectangle(Vector2 position1, Vector2 position2, int fill) {
    Shape shape = new Shape();
    shape.graphics
      ..beginPath()
      ..rect(position1.x, position1.y, position2.x - position1.x,
          position2.y - position1.y)
      ..closePath()
      ..fillColor(fill);
    return shape;
  }

  static Shape filledBar(Vector2 position, double thickness, double length,
      double fillLength, int backColor, int fillColor) {
    Shape shape = new Shape();
    shape.graphics
      ..beginPath()
      ..rect(position.x, position.y, length, thickness)
      ..closePath()
      ..fillColor(backColor)
      ..beginPath()
      ..rect(position.x, position.y, fillLength, thickness)
      ..closePath()
      ..fillColor(fillColor);
    return shape;
  }
}
