import 'package:stagexl/stagexl.dart';

import '../lavendar/entities/entity.dart';

class RenderableEntity {
  Entity entity;
  Sprite sprite;

  RenderableEntity(this.entity) {
    sprite = new Sprite();
    updateImage();
  }

  void updateImage() {}
}
