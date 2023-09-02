import 'package:injectable/injectable.dart';
import 'package:vigorus/file_exporter.dart';

@lazySingleton
class LocalStorageService {
  final GetStorage storage = GetStorage();
  Future<bool> initStorage() async => await GetStorage.init();

  Future<void> write(String key, dynamic value) => storage.write(key, value);

  T? read<T>(String key) => storage.read<T>(key);

  Future<void> delete(String key) => storage.remove(key);

  Future<void> clear() => storage.erase();
}
