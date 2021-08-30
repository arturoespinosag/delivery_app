import 'package:deliveryapp/src/data/providers/remote/authentication_provider.dart';
import 'package:deliveryapp/src/data/providers/remote/food_menu_provider.dart';
import 'package:deliveryapp/src/data/providers/remote/websocket_provider.dart';
import 'package:deliveryapp/src/data/repositories_implementation/authentication_repository_impl.dart';
import 'package:deliveryapp/src/data/repositories_implementation/food_menu_repository_implementation.dart';
import 'package:deliveryapp/src/data/repositories_implementation/websocket_respository_impl.dart';
import 'package:deliveryapp/src/data/respositories/authentication_repository.dart';
import 'package:deliveryapp/src/data/respositories/food_menu_respository.dart';
import 'package:deliveryapp/src/data/respositories/websocket_repository.dart';
import 'package:deliveryapp/src/helpers/get.dart';

// Esta clase se encarga de inyectar AuthenticationProvider y FoodMenuProvider en nuestra aplicación
// Por medio de AuthenticationRepository y FoodMenuRepository

abstract class DependencyInjection {
  static void initialize() {
    final AuthenticationRepository authenticationRepository =
        AuthenticationRepositoryImpl(AuthenticationProvider());

    final FoodMenuRepositoryImplementation foodMenuRepository =
        FoodMenuRepositoryImplementation(FoodMenuProvider());

    final WebsocketRepositoryImpl websocketRepositoryImpl =
        WebsocketRepositoryImpl(WebSocketProvider());

    Get.instance.put<AuthenticationRepository>(authenticationRepository);
    Get.instance.put<FoodMenuRepository>(foodMenuRepository);
    Get.instance.put<WebsocketRepository>(websocketRepositoryImpl);
    Get.instance.put<String>("API_KEY", tag: "apiKey");
    Get.instance.put<String>("SECRET", tag: "secret");
  }
}
