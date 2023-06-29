import 'dart:io';

import 'package:api/api.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storage_repository/storage_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = Directory.current.path;
  await StorageRepository.init(directory);
  final storage = StorageRepository();

  group('Response API', () {
    test('Response from get list data product', () async {
      final data =
          await ApiRepository(storageRepository: storage).fetchDataProduct();
      print(data.bestProduct?[0].name);
      print(data.allProduct?[0].description);
    });

    test('Response from endpoint login', () async {
      /// Insert [password] and [username] to get result response test
      final response = await ApiRepository(storageRepository: storage)
          .login(password: '', username: '');
      print(response.token);
    });

    test('Response from endoiint submit product', () async {
      final response = await ApiRepository(storageRepository: storage)
          .submitProduct(
              name: 'sample', description: 'sample des', pathImage: 'cek');

      print('Cek ${response.imageUrl}');
    });
  });
}
