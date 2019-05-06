import 'package:stagexl/stagexl.dart';

import '../../game.dart';
import '../../lavendar/time.dart';
import 'ui.dart';

class UITimeMultiplier extends UI {
  TextField textField;

  UITimeMultiplier() : super() {
    textField = new TextField();
    textField.defaultTextFormat = new TextFormat(
        'Helvetica,Arial', 14, Color.Green,
        bold: true, italic: true);
    textField.text = "";
    textField.x = stageWidth - 50;
    textField.y = 10;
    textField.width = 50;
    textField.height = 20;
    sprite.addChild(textField);
    Game.stage.addChild(sprite);
  }

  void update() {
    textField.text = Time.multiplier.toString();
  }
}
