class Time {
  bool paused;
  int speed;

  Time() {
    paused = false;
    speed = 5;
  }

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
    speed = (speed + 1).clamp(1, 5);
  }

  void speedDown() {
    speed = (speed - 1).clamp(1, 5);
  }

  void setSpeed(int i) {
    speed = i.clamp(1, 5);
  }
}
