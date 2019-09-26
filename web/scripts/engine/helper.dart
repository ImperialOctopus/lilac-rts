import 'dart:math';

import 'package:vector_math/vector_math.dart';

class Helper {
  static Vector2 clampVector(Vector2 vector, double magnitude) {
    if (vector.length2 > magnitude * magnitude) {
      return vector.normalized() * magnitude;
    } else {
      return vector;
    }
  }

  static Vector2 closestPointOnLine(
      Vector2 point, Vector2 lineStart, Vector2 lineEnd) {
    Vector2 v = lineStart;
    Vector2 w = lineEnd;
    Vector2 p = point;

    // Return minimum distance between line segment vw and point p
    final double l2 = v.distanceToSquared(w); // i.e. |w-v|^2 -  avoid a sqrt
    // Consider the line extending the segment, parameterized as v + t (w - v).
    // We find projection of point p onto the line.
    // It falls where t = [(p-v) . (w-v)] / |w-v|^2
    // We clamp t from [0,1] to handle points outside the segment vw.
    final double t = max(0, min(1, (p - v).dot(w - v) / l2));
    final Vector2 projection =
        v + (w - v).scaled(t); // Projection falls on the segment

    return projection;
  }
}
