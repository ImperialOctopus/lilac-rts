import 'package:stagexl/stagexl.dart';

import '../../lavendar/entities/unit.dart';
import '../renderer.dart';
import 'ui.dart';

class UIReload extends UI {
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
