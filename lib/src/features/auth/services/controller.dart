import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final loginProvider = StateProvider<bool>((ref) {
  return false;
});

class AuthNotifier extends StateNotifier<bool> {
  AuthNotifier() : super(false);

  Future<bool> logIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool('loggedIn', true);
  }
  Future<bool> logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool('loggedIn', false);
  }
}
final testProvider = StateNotifierProvider<AuthNotifier, bool>((ref){
  return AuthNotifier();
});