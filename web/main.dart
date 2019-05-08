import 'dart:html';

import 'scripts/game.dart';

CanvasElement canvas;
CanvasRenderingContext2D ctx;

main() {
  canvas = querySelector('#canvas');
  ctx = canvas.getContext('2d');

  new Game().start();
}
