import 'dart:html';

class Keyboard {
  Map bindings;
  KeyCode keyCode;

  Keyboard() {
    window.onKeyDown.listen(keyDown);
    bindings = new Map<int, Function>();
  }

  void addBinding(int i, Function f) {
    bindings.addAll(<int, Function>{i: f});
  }

  void removeBinding(int i) {
    bindings.remove(i);
  }

  void keyDown(KeyboardEvent e) {
    bindings[e.keyCode]();
  }
}
