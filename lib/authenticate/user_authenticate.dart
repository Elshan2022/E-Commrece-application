import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shopping_application/cache/cache_manager.dart';

final isAuthenticateProvider =
    StateNotifierProvider<UserAuthenticateNotifier, bool>((ref) {
  return UserAuthenticateNotifier();
});

class UserAuthenticateNotifier extends StateNotifier<bool> {
  UserAuthenticateNotifier() : super(false);

  CacheManager manager = CacheManager();
  Future<bool> authenticateUser(BuildContext context) async {
    final id = await manager.getUserId();
    if (id == null) {
      state = false;
      return state;
    } else {
      state = true;
      return state;
    }
  }
}
