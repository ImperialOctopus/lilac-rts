import 'dart:math';

import 'package:vector_math/vector_math.dart';

import '../../lilac_game.dart';
import '../../stage/stages/stage_zero.dart';
import '../menu.dart';
import '../menu_item_image.dart';

class MenuMain extends Menu {
  int width = 300;
  int height = 300;
  String colour = "#FFFFFF";

  MenuMain(LilacGame game) : super(game);

  @override
  Future<void> start() async {
    menuItems.add(MenuItemImage(
        this, Vector2(100, 100), "assets/menu/play.png", 100, 50,
        clickArea: Rectangle(0, 0, 100, 50), clickFunction: startGame));
    await super.start();
  }

  void startGame() {
    game.loadMenu(null);
    game.loadStage(StageZero(game));
  }
}
