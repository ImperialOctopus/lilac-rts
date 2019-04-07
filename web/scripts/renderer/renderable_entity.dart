import 'package:stagexl/stagexl.dart';

import '../lavendar/entities/entity.dart';

class RenderableEntity {
  Entity entity;
  Shape shape;

  RenderableEntity(this.entity) {
    shape = new Shape();
    updateImage();
  }

  void updateImage() {}
}
