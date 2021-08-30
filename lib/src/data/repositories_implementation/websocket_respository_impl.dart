import 'package:deliveryapp/src/data/models/notification.dart';
import 'package:deliveryapp/src/data/providers/remote/websocket_provider.dart';
import 'package:deliveryapp/src/data/respositories/websocket_repository.dart';

class WebsocketRepositoryImpl implements WebsocketRepository {
  final WebSocketProvider _provider;

  WebsocketRepositoryImpl(this._provider);

  @override
  Future<void> connect(String uri) {
    return _provider.connect(uri);
  }

  @override
  Stream<AppNotification> get onNotification => _provider.onNotification;

  @override
  Future<void> disconnect() {
    return _provider.disconnect();
  }
}
