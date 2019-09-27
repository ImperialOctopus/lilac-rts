import '../lilac_game.dart';
import '../stage/game_objects/game_object.dart';
import '../stage/stages/stage.dart';

class Engine {
  LilacGame game;

  Engine(this.game);

  void start() {}

  void update(Stage stage) {
    if (stage != null) {
      for (GameObject e in stage.gameObjects) {
        e.update();
      }
    }
  }
}
