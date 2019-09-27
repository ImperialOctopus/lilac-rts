import 'dart:math';

import 'package:vector_math/vector_math.dart';

import '../../lilac_game.dart';
import '../../stage/stages/stage_zero.dart';
import '../menu_items/menu_item_image.dart';
import 'menu.dart';
import 'menu_ingame.dart';

class MenuMain extends Menu {
  MenuMain(LilacGame game) : super(game);

  @override
  Future<void> start() async {
    menuItems.add(MenuItemImage(
        this, Vector2(100, 100), Vector2(100, 50), "assets/menu/main/play.png",
        clickArea: Rectangle(0, 0, 100, 50), clickFunction: startGame));
    await super.start();
  }

  void startGame() {
    game.unloadMenu();
    game.loadMenu(MenuIngame(game));
    game.loadStage(StageZero(game));
  }
}
