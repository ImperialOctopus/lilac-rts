import 'dart:html';

import '../lilac_game.dart';
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
    keyboard.addBinding(KeyCode.P, () => game.engine.time.pause());
    keyboard.addBinding(KeyCode.O, () => game.engine.time.speedUp());
    keyboard.addBinding(KeyCode.I, () => game.engine.time.speedDown());
    keyboard.addHold(KeyCode.W, () => game.currentStage.cameraPosition.y -= 2);
    keyboard.addHold(KeyCode.S, () => game.currentStage.cameraPosition.y += 2);
    keyboard.addHold(KeyCode.A, () => game.currentStage.cameraPosition.x -= 2);
    keyboard.addHold(KeyCode.D, () => game.currentStage.cameraPosition.x += 2);
    keyboard.start();
    unitSelect.start();
  }

  void update() {
    keyboard.update();
  }
}
