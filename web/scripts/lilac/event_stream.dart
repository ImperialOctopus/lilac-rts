import 'dart:async';

import 'dart:html';

import 'entities/entity.dart';

class EventStream {
  StreamController streamController;

  EventStream() {
    streamController = new StreamController();
  }

  void add(Entity entity) {
    streamController.add(new CustomEvent("EntityCreated", detail: entity));
  }
}
