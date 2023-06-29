import 'package:client/models/login_models.dart';
import 'package:client/models/product_models.dart';

abstract class StoreApiClient {
  Future<LoginModels> login({String? username, String? password});

  Future<ProductModels> fetchDataProduct();

  Future<Product> submitProduct(
      {String? name, String? pathImage, String? description});
}
