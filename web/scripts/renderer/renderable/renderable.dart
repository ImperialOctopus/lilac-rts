import 'package:stagexl/stagexl.dart';

import '../../lavendar/entities/entity.dart';

class Renderable {
  static List<Renderable> all;
  Entity entity;
  Sprite sprite;

  Renderable(this.entity) {
    all.add(this);
    entity.entityDestroyed.stream.listen(destroy);
    sprite = new Sprite();
    loadImage();
  }

  void loadImage() {}

  void update() {
    sprite.x = entity.position.x;
    sprite.y = entity.position.y;
  }

  void destroy(e) {
    sprite.removeFromParent();
    all.remove(this);
  }
}
