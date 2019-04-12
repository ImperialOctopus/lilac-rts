import 'package:stagexl/stagexl.dart';

import '../../lavendar/entities/unit.dart';
import '../renderer.dart';
import 'ui_item.dart';

class UIReload extends UIItem {
  double length = 20;

  Unit unit;

  UIReload(this.unit) : super();

  void update() {
    shape.graphics.clear();
    shape = Renderer.filledBar(
        unit.position,
        3,
        length,
        (unit.fireCooldown / unit.fireCooldownTime) * length,
        Color.Black,
        Color.White);
  }
}
