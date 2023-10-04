import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_shopping_application/cache/cache_manager.dart';
import 'package:flutter_shopping_application/exception/custom_exception.dart';
import 'package:flutter_shopping_application/screens/login/model/user_login_model.dart';
import 'package:flutter_shopping_application/screens/registration/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uuid/uuid.dart';

abstract class IFirebaseAuthService {
  Future<void> signUp(UserModel model);

  Future<void> signIn(UserLoginModel model);

  Future<void> logOut();

  Future<void> signInWithGoogle();

  Future<void> signInWithFacebook();
}

class FireBaseAuthService extends IFirebaseAuthService {
  final FirebaseAuth _instance = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final CacheManager _cacheManager = CacheManager();

  @override
  Future<void> logOut() async {
    try {
      CacheManager cacheManager = CacheManager();
      await cacheManager.deleteUserId();
      await cacheManager.deleteDocumentId();
      await _instance.signOut();
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  @override
  Future<void> signIn(UserLoginModel model) async {
    try {
      await _instance.signInWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );

      final documentId = _instance.currentUser!.uid;

      await _fireStore.collection("users").doc(documentId).update(
        {"userId": model.userId},
      );

      await _cacheManager.saveUserId(model.userId);
      await _cacheManager.saveDocumentId(documentId);
    } on FirebaseAuthException catch (e) {
      throw CustomException(e.message.toString());
    }
  }

  @override
  Future<void> signUp(UserModel model) async {
    try {
      UserCredential? userCredential =
          await _instance.createUserWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );
      await _fireStore
          .collection("users")
          .doc(userCredential.user!.uid)
          .set(model.toJson());

      await _cacheManager.saveUserId(model.userId);
      await _cacheManager.saveDocumentId(userCredential.user!.uid);
    } on FirebaseAuthException catch (e) {
      throw CustomException(e.message.toString());
    }
  }

  @override
  Future<void> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } on FirebaseAuthException catch (e) {
      throw CustomException(e.message.toString());
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await _instance.signInWithCredential(credential).then((value) {
        final uuid = Uuid().v4();
        final nameParts = googleUser!.displayName!.split(" ");
        final email = googleUser.email;
        final name = nameParts.isNotEmpty ? nameParts[0] : "";
        final surname = nameParts.length > 1 ? nameParts[1] : "";
        _fireStore.collection("users").doc(value.user!.uid).set(UserModel(
                name: name,
                surname: surname,
                email: email,
                password: "",
                userId: uuid)
            .toJson());

        _cacheManager.saveUserId(uuid);
        _cacheManager.saveDocumentId(value.user!.uid);
      });
    } on FirebaseAuthException catch (e) {
      throw CustomException(e.message.toString());
    }
  }
}
