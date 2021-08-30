import 'dart:async';

import 'package:deliveryapp/src/data/models/notification.dart';
import 'package:faker/faker.dart';

class WebSocketProvider {
  Future<void> connect(String uri) async {
    await Future.delayed(Duration(seconds: 2));
  }

  StreamController<AppNotification> _controller = StreamController.broadcast();

  Stream<AppNotification> get onNotification => _controller.stream;
  Timer? timer;

  WebSocketProvider() {
    _init();
  }

  _init() {
    timer = Timer.periodic(
      Duration(seconds: 10),
      (timer) {
        final faker = Faker();
        final notification = AppNotification(
          id: DateTime.now().millisecondsSinceEpoch,
          title: '${faker.lorem.word()} ${faker.lorem.word()}',
          description: faker.lorem.sentence(),
          content: {},
          createdAt: DateTime.now(),
        );
        _controller.sink.add(notification);
      },
    );
  }

  Future<void> disconnect() async {
    timer?.cancel();
    await _controller.close();
    await Future.delayed(Duration(seconds: 1));
  }
}
