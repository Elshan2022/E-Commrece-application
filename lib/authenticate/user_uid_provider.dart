import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userUidProvider = FutureProvider<String>((ref) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  final userId = auth.currentUser!.uid;

  return userId;
});
