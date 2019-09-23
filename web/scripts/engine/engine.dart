import '../lilac_game.dart';
import '../stage/game_object.dart';
import '../stage/stage.dart';
import 'time.dart';

class Engine {
  LilacGame game;
  Time time;

  Engine(this.game) {
    time = Time();
  }

  void start() {}

  void update(Stage stage) {
    double timeScale = time.multiplier;
    stage.gameObjects.forEach((GameObject e) {
      e.update(timeScale);
    });
  }
}
