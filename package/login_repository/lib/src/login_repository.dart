import 'package:client/client.dart';

/// {@template RepositoryException}
/// Generic [Exception] thrown by the [RepositoryException].
/// {@endtemplate}
class RepositoryException implements Exception {
  /// {@macro RepositoryException}
  RepositoryException(this.error, this.stackTrace);

  /// The [Exception] which was thrown.
  final Exception error;

  /// The full [StackTrace].
  final StackTrace stackTrace;
}

/// {@template RepositoryException}
/// Generic [Exception] thrown by the [LoginException].
/// {@endtemplate}
class LoginException extends RepositoryException {
  /// {@macro RepositoryException}
  LoginException(super.error, super.stackTrace);
}

class LoginRepository implements Exception {
  LoginRepository({required StoreApiClient storeApiClient})
      : _storeApiClient = storeApiClient;
  final StoreApiClient _storeApiClient;

  Future<LoginModels> login({String? username, String? password}) async {
    try {
      return await _storeApiClient.login(
          username: username, password: password);
    } on Exception catch (error, stackTrace) {
      throw LoginException(error, stackTrace);
    }
  }
}
