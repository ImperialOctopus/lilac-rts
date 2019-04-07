import 'package:stagexl/stagexl.dart';

import '../game.dart';
import '../lavendar/entities/entity.dart';

class RenderableEntity {
  Entity entity;
  Sprite sprite;

  RenderableEntity(this.entity) {
    entity.entityDestroyed.stream.listen(destroy);
    sprite = new Sprite();
    updateImage();
  }

  void updateImage() {}

  void destroy(e) {
    sprite.removeFromParent();
    Game.renderer.renderableEntities.remove(this);
  }
}
