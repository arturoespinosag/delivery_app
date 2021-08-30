import 'dart:async';

import 'package:deliveryapp/src/data/models/notification.dart';
import 'package:deliveryapp/src/data/respositories/websocket_repository.dart';
import 'package:deliveryapp/src/helpers/get.dart';
import 'package:flutter/widgets.dart';

class NotificationsController extends ChangeNotifier {
  final _wsRepository = Get.instance.find<WebsocketRepository>();

  late StreamSubscription _subscription;

  List<AppNotification> _notifications = [];
  List<AppNotification> get notifications => _notifications;

  NotificationsController() {
    print('Notifications controller constructor');
    _subscription =
        _wsRepository.onNotification.listen(this._onNotificationListener);
  }

  void _onNotificationListener(AppNotification notification) {
    print('onNotificationListener');
    _notifications = [notification, ...notifications];
    notifyListeners();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
