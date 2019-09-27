import 'dart:math';

import 'package:vector_math/vector_math.dart';

import '../../engine/ai/ai_random_move.dart';
import '../../lilac_game.dart';
import '../../stage/game_objects/units/unit.dart';
import '../menu_items/menu_item.dart';
import '../menu_items/menu_item_button.dart';
import '../menu_items/menu_item_image.dart';
import 'menu.dart';

class MenuIngame extends Menu {
  MenuIngame(LilacGame game) : super(game);

  @override
  Future<void> start() async {
    menuItems.add(MenuItemImage(
        this, Vector2(0, 0), Vector2(50, 50), "assets/menu/ingame/quit.png",
        alignment: Alignment.TopLeft,
        clickArea: Rectangle(0, 0, 50, 50),
        clickFunction: () => game.stage.quit()));

    menuItems.add(MenuItemButton(this, Vector2(0, -50), Vector2(50, 50),
        "assets/menu/ingame/pause-off.png", "assets/menu/ingame/pause-on.png",
        alignment: Alignment.BottomLeft,
        clickArea: Rectangle(0, 0, 50, 50),
        clickFunction: () => game.stage.time.pause(),
        enabledFunction: () => game.stage.time.paused));
    menuItems.add(MenuItemButton(this, Vector2(50, -50), Vector2(50, 50),
        "assets/menu/ingame/1-off.png", "assets/menu/ingame/1-on.png",
        alignment: Alignment.BottomLeft,
        clickArea: Rectangle(0, 0, 50, 50),
        clickFunction: () => game.stage.time.setSpeed(1),
        enabledFunction: () => game.stage.time.speed == 1));
    menuItems.add(MenuItemButton(this, Vector2(100, -50), Vector2(50, 50),
        "assets/menu/ingame/2-off.png", "assets/menu/ingame/2-on.png",
        alignment: Alignment.BottomLeft,
        clickArea: Rectangle(0, 0, 50, 50),
        clickFunction: () => game.stage.time.setSpeed(2),
        enabledFunction: () => game.stage.time.speed == 2));
    menuItems.add(MenuItemButton(this, Vector2(150, -50), Vector2(50, 50),
        "assets/menu/ingame/3-off.png", "assets/menu/ingame/3-on.png",
        alignment: Alignment.BottomLeft,
        clickArea: Rectangle(0, 0, 50, 50),
        clickFunction: () => game.stage.time.setSpeed(3),
        enabledFunction: () => game.stage.time.speed == 3));
    menuItems.add(MenuItemButton(this, Vector2(200, -50), Vector2(50, 50),
        "assets/menu/ingame/4-off.png", "assets/menu/ingame/4-on.png",
        alignment: Alignment.BottomLeft,
        clickArea: Rectangle(0, 0, 50, 50),
        clickFunction: () => game.stage.time.setSpeed(4),
        enabledFunction: () => game.stage.time.speed == 4));
    menuItems.add(MenuItemButton(this, Vector2(250, -50), Vector2(50, 50),
        "assets/menu/ingame/5-off.png", "assets/menu/ingame/5-on.png",
        alignment: Alignment.BottomLeft,
        clickArea: Rectangle(0, 0, 50, 50),
        clickFunction: () => game.stage.time.setSpeed(5),
        enabledFunction: () => game.stage.time.speed == 5));
    menuItems.add(MenuItemButton(this, Vector2(300, -50), Vector2(50, 50),
        "assets/menu/ingame/warp-off.png", "assets/menu/ingame/warp-on.png",
        alignment: Alignment.BottomLeft,
        clickArea: Rectangle(0, 0, 50, 50),
        clickFunction: () => game.stage.time.toggleWarp(),
        enabledFunction: () => game.stage.time.warp));

    menuItems.add(MenuItemImage(this, Vector2(-50, -50), Vector2(50, 50),
        "assets/menu/ingame/create-enemy.png",
        alignment: Alignment.BottomRight,
        clickArea: Rectangle(0, 0, 50, 50),
        clickFunction: () => game.stage.addUnit(Unit(
            game.stage.randomPosition(), Team.Enemy,
            ai: AIRandomMove()))));
    menuItems.add(MenuItemImage(this, Vector2(-100, -50), Vector2(50, 50),
        "assets/menu/ingame/create-friendly.png",
        alignment: Alignment.BottomRight,
        clickArea: Rectangle(0, 0, 50, 50),
        clickFunction: () => game.stage
            .addUnit(Unit(game.stage.randomPosition(), Team.Friendly))));
    await super.start();
  }
}
