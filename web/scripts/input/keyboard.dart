import 'dart:html';

class Keyboard {
  Map bindings;
  KeyCode keyCode;

  Keyboard() {
    window.onKeyDown.listen(keyDown);
    bindings = Map<int, Function>();
  }

  void addBinding(int i, Function f) {
    bindings[i] = f;
  }

  void removeBinding(int i) {
    bindings.remove(i);
  }

  void keyDown(KeyboardEvent e) {
    if (bindings.containsKey(e.keyCode)) {
      bindings[e.keyCode]();
    }
  }
}
