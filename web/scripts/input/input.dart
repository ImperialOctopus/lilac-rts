import 'dart:html';

import '../lilac-game.dart';
import 'keyboard.dart';
import 'unit_select.dart';

class Input {
  LilacGame game;
  Keyboard keyboard;
  UnitSelect unitSelect;

  Input(this.game) {
    keyboard = Keyboard();
    unitSelect = UnitSelect(game);
  }

  void start() {
    keyboard.addBinding(KeyCode.P, () => {game.engine.time.pause()});
    keyboard.addBinding(KeyCode.O, () => {game.engine.time.speedUp()});
    keyboard.addBinding(KeyCode.I, () => {game.engine.time.speedDown()});
  }
}
