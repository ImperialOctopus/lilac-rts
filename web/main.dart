import 'dart:html';

import 'scripts/game.dart';

CanvasElement canvas;
CanvasRenderingContext2D ctx;

main() {
  canvas = querySelector('#game-canvas');
  ctx = canvas.context2D;

  new Game(ctx).start();
}
