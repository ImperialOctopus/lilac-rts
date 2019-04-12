import 'package:stagexl/stagexl.dart';

import '../../game.dart';
import 'ui_item.dart';

class UIFramerate extends UIItem {
  UIFramerate() : super() {
    var textField1 = new TextField();
    var textFormat1 = new TextFormat('Helvetica,Arial', 14, Color.Green,
        bold: true, italic: true);
    textField1.defaultTextFormat = textFormat1;
    textField1.text = "AAAA";
    textField1.x = 10;
    textField1.y = 10;
    textField1.width = 920;
    textField1.height = 20;
    print("A");
    Game.stage.addChild(textField1);
  }
}
