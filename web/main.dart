import 'dart:html';

import 'scripts/lilac-game.dart';

CanvasElement canvas;

main() {
  canvas = querySelector('#game-canvas');

  LilacGame(canvas.context2D)..start();
}
