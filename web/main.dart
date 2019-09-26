import 'dart:html';

import 'scripts/lilac_game.dart';

main() {
  LilacGame(querySelector('#game-canvas'))..start();
}