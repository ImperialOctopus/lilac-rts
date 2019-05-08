import 'dart:html';

import '../lilac/entities/entity.dart';

class Renderer {
  Stream stream;
  Renderer(Stream this.stream) {
    stream.listen((e) => _entityCreated(e));
  }

  void _entityCreated(CustomEvent event) {
    Entity entity = event.detail;
  }

  void render() {}
}
