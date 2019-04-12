import 'package:stagexl/stagexl.dart';

import '../../lavendar/entities/entity.dart';
import '../../lavendar/entities/projectile.dart';
import '../renderer.dart';
import 'renderable.dart';

class RenderableProjectile extends Renderable {
  Projectile projectile;

  RenderableProjectile(this.projectile) : super(projectile);

  void loadImage() {
    sprite.graphics.clear();
    Shape shape;
    if (projectile.team == Team.Friendly) {
      // Friendly
      shape = Renderer.circle(Color.Black, 2);
    } else if (projectile.team == Team.Enemy) {
      // Enemy
      shape = Renderer.circle(Color.Red, 2);
    }
    sprite.addChild(shape);
  }
}
