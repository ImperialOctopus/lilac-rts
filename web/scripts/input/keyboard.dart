import 'dart:html';

class Keyboard {
  Map<int, Function> pressBindings;
  Map<int, Function> holdBindings;
  Set<int> keysHeld;

  Keyboard() {
    pressBindings = Map<int, Function>();
    holdBindings = Map<int, Function>();
    keysHeld = Set<int>();
  }

  void start() {
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
