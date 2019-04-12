import 'package:stagexl/stagexl.dart';

import '../../game.dart';
import 'ui_item.dart';

class UIFramerate extends UIItem {
  TextField textField;

  UIFramerate() : super() {
    textField = new TextField();
    textField.defaultTextFormat = new TextFormat(
        'Helvetica,Arial', 14, Color.Green,
        bold: true, italic: true);
    textField.text = "AAAA";
    textField.x = 10;
    textField.y = 10;
    textField.width = 920;
    textField.height = 20;
    Game.stage.addChild(textField);
  }

  void update() {
    textField.text = (1 / Game.deltaTime).round().toString() + " FPS";
  }
}
