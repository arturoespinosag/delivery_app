import 'package:deliveryapp/src/data/providers/authentication_provider.dart';
import 'package:deliveryapp/src/data/repositories_implementation/authentication_repository_impl.dart';
import 'package:deliveryapp/src/data/respositories/authentication_repository.dart';
import 'package:deliveryapp/src/helpers/get.dart';

abstract class DependencyInjection {
  static void initialize() {
    final AuthenticationRepository _authenticationRepository =
        AuthenticationRepositoryImpl(AuthenticationProvider());

    Get.instance.put<AuthenticationRepository>(_authenticationRepository);
  }
}
