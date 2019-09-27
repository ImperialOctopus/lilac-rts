import 'dart:html';

import '../../lilac_game.dart';
import 'menu.dart';

class MenuNull extends Menu {
  MenuNull(LilacGame game) : super(game);

  @override
  Future<void> start() async {}

  @override
  void update() {}

  @override
  void mouseDown(MouseEvent e) {}

  @override
  void mouseUp(MouseEvent e) {}
}
