import 'package:vector_math/vector_math.dart';

import '../../engine/ai/ai_random_move.dart';
import '../../renderer/renderer.dart';
import '../game_objects/ghosts/ghost_rectangle.dart';
import '../game_objects/obstacles/obstacle_wall.dart';
import '../game_objects/units/unit.dart';
import '../game_objects/units/unit_tank.dart';
import 'stage.dart';

class Stage1 extends Stage {
  final int height = 1000;
  final int width = 1000;
  final String backgroundColour = "#EEEEEE";

  Stage1(game) : super(game);

  @override
  void start() {
    addUnit(UnitTank(Vector2(150, 850), Team.Friendly));

    addUnit(UnitTank(Vector2(850, 150), Team.Enemy, ai: AIRandomMove()));

    // Middle building
    addObstacle(ObstacleWall(Vector2(400, 200), Vector2(600, 200)));
    addObstacle(ObstacleWall(Vector2(400, 200), Vector2(400, 800)));
    addObstacle(ObstacleWall(Vector2(600, 800), Vector2(400, 800)));
    addObstacle(ObstacleWall(Vector2(600, 800), Vector2(600, 200)));
    addGhost(GhostRectangle(
        Vector2(400, 200), Vector2(200, 600), Renderer.backgroundColour));

    super.start();
  }
}
