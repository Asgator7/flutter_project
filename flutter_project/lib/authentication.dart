import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  getUID() {
    final uid = _auth.currentUser?.uid;
    final result = {'success': true, 'message': uid};
    return result;
  }

  Future signUp({String email, String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return getUID();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return {
          'success': false,
          'message': 'The password provided is too weak.'
        };
      } else if (e.code == 'email-already-in-use') {
        return {
          'success': false,
          'message': 'The account already exists for that email.'
        };
      } else if (e.code == 'invalid-email') {
        return {
          'success': false,
          'message': 'The email address is badly formatted.'
        };
      }
      return e.message;
    }
  }

  Future<dynamic> signIn({String email, String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return getUID();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return {
          'success': false,
          'message':
              'Não existe um usuário correspondente a este identificador. O usuário pode ter sido excluído.'
        };
      } else if (e.code == 'wrong-password') {
        return {
          'sucess': false,
          'message': 'Senha inválida ou usuário não possui senha.'
        };
      }
      return e.message;
    }
  }

  Future<String> signOut() async {
    try {
      await _auth.signOut();
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
