import 'package:deneme_instagram1/repository/user_repository.dart';
import 'package:deneme_instagram1/services/fake_auth_service.dart';
import 'package:deneme_instagram1/services/firebase_auth_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => FirebaseAuthService());
  locator.registerLazySingleton(() => FakeAuthenticationService());
  locator.registerLazySingleton(() => UserRepository());
}
