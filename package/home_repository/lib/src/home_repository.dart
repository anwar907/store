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
/// Generic [Exception] thrown by the [ListDataException].
/// {@endtemplate}
class ListDataException extends RepositoryException {
  /// {@macro RepositoryException}
  ListDataException(super.error, super.stackTrace);
}

/// {@template RepositoryException}
/// Generic [Exception] thrown by the [SubmitDataException].
/// {@endtemplate}
class SubmitDataException extends RepositoryException {
  /// {@macro RepositoryException}
  SubmitDataException(super.error, super.stackTrace);
}

class HomeRepository implements Exception {
  HomeRepository({required StoreApiClient storeApiClient})
      : _storeApiClient = storeApiClient;
  final StoreApiClient _storeApiClient;

  Future<ProductModels> fetchListProduct() async {
    try {
      return await _storeApiClient.fetchDataProduct();
    } on Exception catch (error, stackTrace) {
      throw ListDataException(error, stackTrace);
    }
  }

  Future<Product> submitDataProduct(
      {String? name, String? imagePath, String? description}) async {
    try {
      return await _storeApiClient.submitProduct(
          name: name, pathImage: imagePath, description: description);
    } on Exception catch (error, stackTrace) {
      throw SubmitDataException(error, stackTrace);
    }
  }
}
