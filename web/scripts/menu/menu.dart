import 'dart:html';

import '../lilac_game.dart';
import 'menu_item.dart';

class Menu {
  LilacGame game;

  Set<MenuItem> menuItems;

  Menu(this.game) {
    menuItems = Set<MenuItem>();
  }

  Future<void> start() async {
    List<Future<void>> futures = List<Future<void>>();
    for (MenuItem menuItem in menuItems) {
      futures.add(menuItem.start());
    }
    await Future.wait(futures);
  }

  void update() {}

  void mouseDown(MouseEvent e) {
    for (MenuItem menuItem in menuItems) {
      menuItem.checkClick(e.offset);
    }
  }

  void mouseUp(MouseEvent e) {}
}
