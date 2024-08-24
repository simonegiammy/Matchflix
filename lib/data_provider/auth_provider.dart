import 'package:firebase_auth/firebase_auth.dart';
import 'package:matchflix/data_repository/storage_repository.dart';

class AuthProvider{

static Future<bool> login (String mail, String password) async{
    try {
      print(mail);
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: mail.toString(),
    password: password.toString()
  );
  StorageRepository.saveCredential(mail, password);
  print(credential.user);
  return true;
} on FirebaseAuthException catch (e) {
  print(e);
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
  return false;
}
  }
  static Future<bool> signUp (String mail, String password) async{
    try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: mail,
    password: password
  );
  print(credential.user);
    StorageRepository.saveCredential(mail, password);

  return true;
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
  return false;
}
  }
}