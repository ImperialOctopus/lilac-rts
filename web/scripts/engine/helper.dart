import 'package:vector_math/vector_math.dart';

class Helper {
  static Vector2 clampVector(Vector2 vector, double magnitude) {
    if (vector.length2 > magnitude * magnitude) {
      return vector.normalized() * magnitude;
    } else {
      return vector;
    }
  }
}
