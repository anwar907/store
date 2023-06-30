import 'package:client/client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_repository/home_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeRepository extends Mock implements StoreApiClient {}

class FakeHome extends Fake implements ProductModels {}

void main() {
  final apiClient = MockHomeRepository();
  final repository = HomeRepository(storeApiClient: apiClient);
  group('List Data Product from Repository', () {
    test('Return Exception', () async {
      when(apiClient.fetchDataProduct).thenThrow(Exception('Something Wrong'));
      expect(() async => repository.fetchListProduct(),
          throwsA(isA<ListDataException>()));
    });

    test('Return Data', () async {
      when(() => apiClient.fetchDataProduct())
          .thenAnswer((_) async => ProductModels());
      expect(await repository.fetchListProduct(), isA<ProductModels>());
    });
  });

  group('Form submit data product', () {
    test('Return Exception', () async {
      when(() => apiClient.submitProduct(
          description: any(named: 'description'),
          name: any(named: 'name'),
          pathImage: any(named: 'pathImage'))).thenThrow(Exception("oops"));

      expect(
          () async => repository.submitDataProduct(
              description: "des", imagePath: "image", name: "name"),
          throwsA(isA<SubmitDataException>()));
    });

    test('Return Data Product', () async {
      when(() => apiClient.submitProduct(
          description: any(named: 'description'),
          name: any(named: 'name'),
          pathImage: any(named: 'pathImage'))).thenAnswer((_) async => Product());

      expect(
          await repository.submitDataProduct(
              description: 'des', imagePath: 'image', name: 'name'),
          isA<Product>());
    });
  });
}
