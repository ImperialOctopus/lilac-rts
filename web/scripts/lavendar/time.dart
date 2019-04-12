class Time {
  static bool paused;
  static int speed;

  Time() {
    paused = false;
    speed = 5;
  }

  static double get multiplier {
    if (paused) {
      return 0;
    } else {
      return speed * 0.2;
    }
  }

  static void pause() {
    paused = !paused;
  }

  static void speedUp() {
    speed = (speed + 1).clamp(0, 5);
  }

  static void speedDown() {
    speed = (speed - 1).clamp(0, 5);
  }
}
