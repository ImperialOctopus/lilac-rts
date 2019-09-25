import '../../stage/stage.dart';
import '../../stage/unit.dart';
import 'instruction.dart';

abstract class UnitAI {
  Unit unit;
  Stage stage;
  UnitAI(this.unit, this.stage);

  Instruction update();
}
