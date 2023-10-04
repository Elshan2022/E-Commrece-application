import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shopping_application/authenticate/user_uid_provider.dart';
import 'package:flutter_shopping_application/screens/profile/model/user_information_model.dart';
import 'package:flutter_shopping_application/screens/profile/providers/user_image_provider.dart';

final getUserInformationProvider =
    StateNotifierProvider<UserInformationNotifier, UserInformationModel>((ref) {
  return UserInformationNotifier(ref);
});

class UserInformationNotifier extends StateNotifier<UserInformationModel> {
  UserInformationNotifier(this.ref) : super(const UserInformationModel());

  final Ref ref;

  Future<UserInformationModel?> getUserInformation() async {
    final documentId = await ref.watch(userUidProvider.future);
    final fireStore = ref.watch(cloudFiresStoreInstance);
    final snapShot = await fireStore.collection("users").doc(documentId).get();
    if (snapShot.exists) {
      final name = snapShot.get("name");
      final surname = snapShot.get("surname");
      final email = snapShot.get("email");
      state = UserInformationModel(email: email, name: name, surname: surname);
      return state;
    } else {
      return null;
    }
  }
}
