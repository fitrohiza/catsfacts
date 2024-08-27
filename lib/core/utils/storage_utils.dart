import 'package:get_storage/get_storage.dart';

class StorageUtils {
  final _storage = GetStorage();

  String get username => _storage.read('username') ?? '';
  set username(String value) => _storage.write('username', value);

  String get password => _storage.read('password') ?? '';
  set password(String value) => _storage.write('password', value);

  void clearSession() {
    _storage.erase();
  }
}
