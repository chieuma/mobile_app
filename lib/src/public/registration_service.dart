import 'package:firebase_auth/firebase_auth.dart';

class RegistrationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      if (user != null) {
        // Đăng ký thành công, bạn có thể thực hiện các hành động khác nếu cần.
        return null; // Trả về null để chỉ ra rằng không có lỗi.
      } else {
        return 'Đăng ký thất bại, vui lòng thử lại sau.';
      }
    } catch (e) {
      // Xử lý lỗi đăng ký, ví dụ: email đã tồn tại, mật khẩu yếu, ...
      return 'Đăng ký thất bại: $e';
    }
  }
}
