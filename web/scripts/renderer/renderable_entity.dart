import 'package:stagexl/stagexl.dart';

import '../game.dart';
import '../lavendar/entities/entity.dart';

class RenderableEntity {
  Entity entity;
  Sprite sprite;

  RenderableEntity(this.entity) {
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
    Game.renderer.renderableEntities.remove(this);
  }
}
