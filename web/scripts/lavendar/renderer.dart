import 'dart:html';
import 'dart:math';

import '../game.dart';
import '../lilac/entities/entity.dart';

class Renderer {
  final backgroundColour = "#FFFFFF";

  CanvasRenderingContext2D context;
  List<Entity> entityList;

  Renderer(this.context, this.entityList) {}

  void start() {
    awaitFrame();
  }

  Future awaitFrame() async {
    render(await window.animationFrame);
  }

  void render(num m) {
    clear();

    for (Entity e in entityList) {
      renderEntity(e);
    }

    awaitFrame();
  }

  void renderEntity(Entity entity) {
    context
      ..beginPath()
      ..arc(entity.position.x, entity.position.y, 10, 0, 2 * pi)
      ..fillStyle = "black"
      ..fill();
  }

  void clear() {
    context
      ..beginPath()
      ..rect(0, 0, Game.stageWidth, Game.stageHeight)
      ..fillStyle = backgroundColour
      ..fill();
  }
}
