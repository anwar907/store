import 'package:hive/hive.dart';

class StorageRepository {
  static const token = 'token';

  static Future<void> init(String path) async {
    Hive.init(path);
  }

  Future<String> setToken(String result) async {
    final box = await Hive.openBox<String>(token);
    await box.put(token, result);

    return result;
  }

  Future<String?> getToken() async {
    final box = await Hive.openBox<String>(token);
    final result = box.get(token, defaultValue: null);
    return result;
  }
}
