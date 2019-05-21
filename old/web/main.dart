import 'dart:html';

import 'scripts/game.dart';

CanvasElement canvas;

main() {
  canvas = querySelector('#game-canvas');

  new Game(canvas).start();
}
