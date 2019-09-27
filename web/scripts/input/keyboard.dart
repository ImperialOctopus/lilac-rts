import 'dart:html';

import '../engine/ai/ai_random_move.dart';
import '../lilac_game.dart';
import '../menu/menus/menu_main.dart';
import '../stage/units/unit.dart';

class Keyboard {
  LilacGame game;

  Map<int, Function> pressBindings;
  Map<int, Function> holdBindings;
  Set<int> keysHeld;

  Keyboard(this.game) {
    pressBindings = Map<int, Function>();
    holdBindings = Map<int, Function>();
    keysHeld = Set<int>();
  }

  void start() {
    // Time control
    addBinding(KeyCode.P, () => game.stage.time.pause());
    addBinding(KeyCode.SPACE, () => game.stage.time.pause());

    addBinding(KeyCode.O, () => game.stage.time.speedUp());
    addBinding(KeyCode.I, () => game.stage.time.speedDown());

    // Test unit creation
    addBinding(
        KeyCode.Z,
        () => game.stage
            .addUnit(Unit(game.stage.randomPosition(), Team.Friendly)));
    addBinding(
        KeyCode.X,
        () => game.stage.addUnit(
            Unit(game.stage.randomPosition(), Team.Enemy, ai: AIRandomMove())));

    // Camera movement
    addHold(KeyCode.W, () => game.stage.cameraPosition.y -= 2);
    addHold(KeyCode.UP, () => game.stage.cameraPosition.y -= 2);

    addHold(KeyCode.S, () => game.stage.cameraPosition.y += 2);
    addHold(KeyCode.DOWN, () => game.stage.cameraPosition.y += 2);

    addHold(KeyCode.A, () => game.stage.cameraPosition.x -= 2);
    addHold(KeyCode.LEFT, () => game.stage.cameraPosition.x -= 2);

    addHold(KeyCode.D, () => game.stage.cameraPosition.x += 2);
    addHold(KeyCode.RIGHT, () => game.stage.cameraPosition.x += 2);

    // Main menu
    addBinding(KeyCode.ESC, () {
      game.loadStage(null);
      game.loadMenu(MenuMain(game));
    });

    window.onKeyDown.listen(keyDown);
    window.onKeyUp.listen(keyUp);
  }

  void update() {
    holdBindings.forEach((i, f) {
      if (keysHeld.contains(i)) {
        f();
      }
    });
  }

  void keyDown(KeyboardEvent e) {
    if (pressBindings.containsKey(e.keyCode)) {
      pressBindings[e.keyCode]();
    }
    keysHeld.add(e.keyCode);
  }

  void keyUp(KeyboardEvent e) {
    keysHeld.remove(e.keyCode);
  }

  void addBinding(int i, Function f) {
    pressBindings[i] = f;
  }

  void removeBinding(int i) {
    pressBindings.remove(i);
  }

  void addHold(int i, Function f) {
    holdBindings[i] = f;
  }

  void removeHold(int i, Function f) {
    holdBindings.remove(i);
  }
}
