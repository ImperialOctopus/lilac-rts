import 'dart:math';

import 'package:vector_math/vector_math.dart';

import '../../lilac_game.dart';
import '../../stage/stages/stage_0.dart';
import '../../stage/stages/stage_1.dart';
import '../../stage/stages/stage_2.dart';
import '../../stage/stages/stage_3.dart';
import '../../stage/stages/stage_4.dart';
import '../../stage/stages/stage_5.dart';
import '../menu_items/menu_item.dart';
import '../menu_items/menu_item_image.dart';
import 'menu.dart';
import 'menu_ingame.dart';

class MenuMain extends Menu {
  MenuMain(LilacGame game) : super(game);

  @override
  Future<void> start() async {
    menuItems.add(MenuItemImage(
        this, Vector2(0, -100), Vector2(250, 110), "assets/menu/main/logo.png",
        alignment: Alignment.Centre));

    menuItems.add(MenuItemImage(this, Vector2(-50, 50), Vector2(100, 76),
        "assets/menu/main/stage-0.png",
        alignment: Alignment.Centre,
        clickArea: Rectangle(0, 0, 100, 76),
        clickFunction: () => startGame(0)));
    menuItems.add(MenuItemImage(
        this, Vector2(50, 50), Vector2(100, 76), "assets/menu/main/stage-1.png",
        alignment: Alignment.Centre,
        clickArea: Rectangle(0, 0, 100, 76),
        clickFunction: () => startGame(1)));

    menuItems.add(MenuItemImage(this, Vector2(-50, 126), Vector2(100, 76),
        "assets/menu/main/stage-2.png",
        alignment: Alignment.Centre,
        clickArea: Rectangle(0, 0, 100, 76),
        clickFunction: () => startGame(2)));
    menuItems.add(MenuItemImage(this, Vector2(50, 126), Vector2(100, 76),
        "assets/menu/main/stage-3.png",
        alignment: Alignment.Centre,
        clickArea: Rectangle(0, 0, 100, 76),
        clickFunction: () => startGame(3)));

    menuItems.add(MenuItemImage(this, Vector2(-50, 202), Vector2(100, 76),
        "assets/menu/main/stage-4.png",
        alignment: Alignment.Centre,
        clickArea: Rectangle(0, 0, 100, 76),
        clickFunction: () => startGame(4)));
    menuItems.add(MenuItemImage(this, Vector2(50, 202), Vector2(100, 76),
        "assets/menu/main/stage-5.png",
        alignment: Alignment.Centre,
        clickArea: Rectangle(0, 0, 100, 76),
        clickFunction: () => startGame(5)));
    await super.start();
  }

  void startGame(int i) {
    game.unloadMenu();
    game.loadMenu(MenuIngame(game));

    switch (i) {
      case 0:
        game.loadStage(Stage0(game));
        break;
      case 1:
        game.loadStage(Stage1(game));
        break;
      case 2:
        game.loadStage(Stage2(game));
        break;
      case 3:
        game.loadStage(Stage3(game));
        break;
      case 4:
        game.loadStage(Stage4(game));
        break;
      case 5:
        game.loadStage(Stage5(game));
        break;
      default:
    }
  }
}
