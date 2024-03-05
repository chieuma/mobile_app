import 'package:firebase_auth/firebase_auth.dart';

class AuthLogin {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> signInWithEmaiAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      if (user != null) {
        return null;
      } else {
        return 'Dang nhap that bai';
      }
    } catch (e) {
      return 'Dang nhap that bai: $e';
    }
  }
}
