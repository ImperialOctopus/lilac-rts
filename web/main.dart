import 'dart:html';

import 'scripts/lilac_game.dart';

CanvasElement canvas;

main() {
  canvas = querySelector('#game-canvas');
  window.onResize.listen((Event e) => resizeCanvas());
  resizeCanvas();

  LilacGame(canvas.context2D)..start();
}

void resizeCanvas() {
  canvas.width = window.innerWidth;
  canvas.height = window.innerHeight;
}
