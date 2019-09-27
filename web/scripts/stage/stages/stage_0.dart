import 'package:vector_math/vector_math.dart';

import '../../engine/ai/ai_random_move.dart';
import '../obstacles/obstacle_wall.dart';
import '../units/unit.dart';
import 'stage.dart';

class Stage0 extends Stage {
  final int height = 1000;
  final int width = 1000;
  final String colour = "#EEEEEE";

  Stage0(game) : super(game);

  @override
  void start() {
    addUnit(Unit(Vector2(150, 850), Team.Friendly));
    addUnit(Unit(Vector2(150, 900), Team.Friendly));
    addUnit(Unit(Vector2(100, 850), Team.Friendly));

    addUnit(Unit(Vector2(850, 150), Team.Enemy, ai: AIRandomMove()));
    addUnit(Unit(Vector2(850, 100), Team.Enemy, ai: AIRandomMove()));
    addUnit(Unit(Vector2(900, 150), Team.Enemy, ai: AIRandomMove()));

    // Top left building
    addObstacle(ObstacleWall(Vector2(0, 300), Vector2(300, 300)));
    addObstacle(ObstacleWall(Vector2(300, 0), Vector2(300, 300)));

    // Bottom right building
    addObstacle(ObstacleWall(Vector2(1000, 700), Vector2(700, 700)));
    addObstacle(ObstacleWall(Vector2(700, 1000), Vector2(700, 700)));

    // Middle building
    addObstacle(ObstacleWall(Vector2(350, 350), Vector2(350, 650)));
    addObstacle(ObstacleWall(Vector2(350, 350), Vector2(650, 350)));
    addObstacle(ObstacleWall(Vector2(650, 650), Vector2(350, 650)));
    addObstacle(ObstacleWall(Vector2(650, 650), Vector2(650, 350)));

    super.start();
  }
}
