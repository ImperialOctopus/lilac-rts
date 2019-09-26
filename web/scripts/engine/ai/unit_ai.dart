import '../../stage/units/unit.dart';
import 'instruction.dart';

abstract class UnitAI {
  Unit unit;

  Instruction update();
}
