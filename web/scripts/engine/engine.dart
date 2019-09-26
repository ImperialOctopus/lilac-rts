import '../lilac_game.dart';
import '../stage/game_object.dart';
import '../stage/stages/stage.dart';
import 'time.dart';

class Engine {
  LilacGame game;
  Time time;

  Engine(this.game) {
    time = Time();
  }

  void start() {}

  void update(Stage stage) {
    for (GameObject e in stage.gameObjects) {
      e.update(time.multiplier);
    }
  }
}
