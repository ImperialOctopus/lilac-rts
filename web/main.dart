import 'dart:html';

import 'scripts/lilac_game.dart';

CanvasElement canvas;

main() {
  canvas = querySelector('#game-canvas');

  LilacGame(canvas.context2D)..start();
}
