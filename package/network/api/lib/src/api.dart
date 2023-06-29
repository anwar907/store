import 'dart:convert';

import 'package:client/client.dart';
import 'package:http/http.dart' as http;
import 'package:storage_repository/storage_repository.dart';

class ApiRepository implements StoreApiClient {
  ApiRepository({required StorageRepository storageRepository})
      : _storageRepository = storageRepository;
  final StorageRepository _storageRepository;
  @override
  Future<LoginModels> login({String? username, String? password}) async {
    try {
      final body = jsonEncode({'username': username, 'password': password});
      final response =
          await http.post(Uri.parse('${BaseUrl.baseUrl}login'), body: body);

      await _storageRepository.setToken(response.body);

      return LoginModels.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw Future.error(e);
    }
  }

  @override
  Future<ProductModels> fetchDataProduct() async {
    try {
      final token = await _storageRepository.getToken();
      String result = '$token';

      Map<String, dynamic> value = jsonDecode(result);

      String data = value['token'];

      final response =
          await http.get(Uri.parse('${BaseUrl.baseUrl}product'), headers: {
        'Authorization': 'Bearer $data',
      });

      return ProductModels.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw Future.error(e);
    }
  }

  @override
  Future<Product> submitProduct(
      {String? name, String? pathImage, String? description}) async {
    try {
      final token = await _storageRepository.getToken();
      String result = '$token';

      Map<String, dynamic> value = jsonDecode(result);

      String data = value['token'];

      final imageurl =
          http.MultipartFile.fromString('productImage', pathImage ?? '');
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('${BaseUrl.baseUrl}product'),
      )
        ..fields['productName'] = name ?? ''
        ..fields['productDecription'] = description ?? ''
        ..files.add(imageurl)
        ..headers['Authorization'] = data;

      final response = await request.send();

      final reslut = await http.Response.fromStream(response);

      Map<String, dynamic> cekDat = jsonDecode(reslut.body);

      return Product.fromJson(cekDat);
    } catch (e) {
      throw Future.error(e);
    }
  }
}
