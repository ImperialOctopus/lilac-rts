import 'package:vector_math/vector_math.dart';

import '../../engine/ai/ai_random_move.dart';
import '../obstacles/obstacle_wall.dart';
import '../units/unit.dart';
import 'stage.dart';

class StageZero extends Stage {
  final int height = 1000;
  final int width = 1000;
  final String colour = "#EEEEEE";

  StageZero(game) : super(game);

  @override
  void start() {
    addUnit(Unit(Vector2(50, 50), Team.Friendly));
    addUnit(Unit(Vector2(100, 50), Team.Friendly));
    addUnit(Unit(Vector2(100, 100), Team.Enemy, ai: AIRandomMove()));
    addObstacle(ObstacleWall(Vector2(300, 300), Vector2(400, 400)));
  }
}
