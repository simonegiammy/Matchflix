import 'package:shared_preferences/shared_preferences.dart';

class StorageRepository{
  static Future<void> saveCredential(String email, String password) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("email", email);
    sp.setString("password", password);
  }
  static Future<Map<String, String?>> getCredential() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? email = sp.getString("email");
    String? password = sp.getString("password");
    return {"email": email?.trim().toLowerCase(),"password": password?.trim()};
  }

}