import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  static const _storage = FlutterSecureStorage();

  static const _nameKey = 'name';
  static const _dateKey = 'date';

  static Future setName(String name) async {
    await _storage.write(key: _nameKey, value: name);
  }

  static Future<String?> getName() async => await _storage.read(key: _nameKey);

  static Future setDate(DateTime dateTime) async {
    await _storage.write(key: _dateKey, value: dateTime.toIso8601String());
  }

  static Future<DateTime?> getDate() async {
    final date = await _storage.read(key: _dateKey);
    return date == null ? null : DateTime.tryParse(date);
  }
}
