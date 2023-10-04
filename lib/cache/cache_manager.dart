import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CacheManager {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  saveUserId(String uuid) async {
    await _secureStorage.write(key: "userId", value: uuid);
  }

  saveDocumentId(String uuid) async {
    await _secureStorage.write(key: "documentId", value: uuid);
  }

  getUserId() async {
    final uuid = await _secureStorage.read(key: "userId");
    return uuid;
  }

  getDocumentId() async {
    final uuid = await _secureStorage.read(key: "documentId");
    return uuid;
  }

  deleteUserId() async {
    await _secureStorage.delete(key: "userId");
  }

  deleteDocumentId() async {
    await _secureStorage.delete(key: "documentId");
  }
}
