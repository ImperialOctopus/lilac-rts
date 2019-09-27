class Time {
  bool paused;
  bool warp;
  int speed;

  Time() {
    paused = false;
    warp = false;
    speed = 5;
  }

  double get multiplier {
    return (paused ? 0 : speed * 0.2) + (warp ? 0.4 : 0);
  }

  void pause() {
    paused = !paused;
  }

  void toggleWarp() {
    warp = !warp;
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
