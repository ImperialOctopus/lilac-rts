import 'package:stagexl/stagexl.dart';
import 'package:vector_math/vector_math.dart';

import '../game.dart';
import '../lavendar/entities/projectile.dart';
import '../lavendar/entities/unit.dart';
import 'renderable_entity.dart';
import 'renderable_projectile.dart';
import 'renderable_unit.dart';

class Renderer {
  List<RenderableEntity> renderableEntities;
  List<RenderableUnit> renderableUnits;
  Shape unitSelectShape;
  Shape backgroundShape;

  Renderer() {
    renderableEntities = new List<RenderableEntity>();
    renderableUnits = new List<RenderableUnit>();
    unitSelectShape = new Shape();
    backgroundShape = new Shape();
  }

  void createBackground(Vector2 size, int color) {
    backgroundShape = rectangle(new Vector2(0, 0), size, color);
    Game.stage.addChild(backgroundShape);
  }

  void addUnit(Unit unit) {
    RenderableUnit u = new RenderableUnit(unit);
    renderableEntities.add(u);
    renderableUnits.add(u);
  }

  void addProjectile(Projectile projectile) {
    RenderableProjectile p = new RenderableProjectile(projectile);
    renderableEntities.add(p);
  }

  void updateUnits() {
    for (RenderableUnit ru in renderableUnits) {
      ru.updateImage();
    }
  }

  void renderEntities() {
    for (RenderableEntity re in renderableEntities) {
      re.sprite.x = re.entity.position.x;
      re.sprite.y = re.entity.position.y;
      Game.stage.addChild(re.sprite);
    }
  }

  void renderSelection() {
    unitSelectShape.graphics.clear();
    if (Game.userInput.selecting) {
      Vector2 mouse = new Vector2(Game.stage.mouseX, Game.stage.mouseY);
      mouse.clampScalar(0, 600);
      unitSelectShape =
          borderedRectangle(Game.userInput.position1, mouse, Color.White);
    }
    Game.stage.addChild(unitSelectShape);
  }

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
}
