import '../lilac_game.dart';
import 'keyboard.dart';
import 'mouse.dart';

class Input {
  LilacGame game;
  Keyboard keyboard;
  Mouse mouse;

  Input(this.game) {
    keyboard = Keyboard(game);
    mouse = Mouse(game);
  }

  void start() {
    keyboard.start();
    mouse.start();
  }

  void update() {
    keyboard.update();
  }
}
