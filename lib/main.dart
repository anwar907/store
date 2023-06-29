import 'package:api/api.dart';
import 'package:flutter/material.dart';
import 'package:home_repository/home_repository.dart';
import 'package:login_repository/login_repository.dart';
import 'package:storage_repository/storage_repository.dart';
import 'package:store/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Init Have local storage
  await StorageRepository.init();

  /// Init API package

  final storage = StorageRepository();
  final apiRepository = ApiRepository(storageRepository: storage);
  final homeRepository = HomeRepository(storeApiClient: apiRepository);
  final loginRepository = LoginRepository(storeApiClient: apiRepository);

  final app =
      App(homeRepository: homeRepository, loginRepository: loginRepository);

  runApp(app);
}
