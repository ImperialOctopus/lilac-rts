class Time {
  bool paused = false;
  int speed = 5;

  double get multiplier {
    if (paused) {
      return 0;
    } else {
      return speed * 0.2;
    }
  }

  void pause() {
    paused = !paused;
  }

  void speedUp() {
    speed = (speed + 1).clamp(0, 5);
  }

  void speedDown() {
    speed = (speed - 1).clamp(0, 5);
  }
}