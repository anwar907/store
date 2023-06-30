import 'package:client/client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_repository/login_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginRepository extends Mock implements StoreApiClient {}

class FakeLogin extends Fake implements LoginModels {}

void main() {
  final api = MockLoginRepository();

  final repository = LoginRepository(storeApiClient: api);
  group('Login Repository', () {
    test('Return Exception', () async {
      when(() => api.login(
              password: any(named: 'password'),
              username: any(named: 'username')))
          .thenThrow(Exception('Something Wrong'));

      expect(() => repository.login(password: 'pass', username: 'user'),
          throwsA(isA<LoginException>()));
    });

    test('Return Data ', () async {
      when(() => api.login(
              password: any(named: 'password'),
              username: any(named: 'username')))
          .thenAnswer((_) async => LoginModels());
      expect(await repository.login(password: 'pass', username: 'user'),
          isA<LoginModels>());
    });
  });
}
