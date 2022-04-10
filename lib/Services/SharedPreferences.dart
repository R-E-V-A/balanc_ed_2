import 'package:shared_preferences/shared_preferences.dart';

Future<bool> saveToken(
    {required String saveKey, required String saveValue}) async {
  final prefs = await SharedPreferences.getInstance();
  final value = prefs.setString(saveKey, saveValue);
  if (value != null) {
    return true;
  } else {
    return false;
  }
}

Future<String?> getToken({required String key}) async {
  final prefs = await SharedPreferences.getInstance();
  final getkey = '$key';
  final value = prefs.getString(getkey) ?? null;
  print("THIS IS TOKEN IN SPREF");
  print(value);
  return value;
}

Future<bool> saveUsername(
    {required String saveKey, required String saveValue}) async {
  final prefs = await SharedPreferences.getInstance();
  final value = prefs.setString(saveKey, saveValue);
  if (value != null) {
    return true;
  } else {
    return false;
  }
}

Future<String?> getUsername({required String key}) async {
  final prefs = await SharedPreferences.getInstance();
  final getkey = '$key';
  final value = prefs.getString(getkey) ?? null;
  print("THIS IS Username IN SPREF");
  print(value);
  return value;
}

Future<bool> saveEmail(
    {required String saveKey, required String saveValue}) async {
  final prefs = await SharedPreferences.getInstance();
  final value = prefs.setString(saveKey, saveValue);
  if (value != null) {
    return true;
  } else {
    return false;
  }
}

Future<String?> getEmail({required String key}) async {
  final prefs = await SharedPreferences.getInstance();
  final getkey = '$key';
  final value = prefs.getString(getkey) ?? null;
  print("THIS IS Email IN SPREF");
  print(value);
  return value;
}

deleteLocalKey(String key) async {
  final prefs = await SharedPreferences.getInstance();
  final finalKey = '$key';
  prefs.remove(finalKey);
  prefs.clear();
}

Future<bool> savePic(
    {required String saveKey, required String saveValue}) async {
  final prefs = await SharedPreferences.getInstance();
  final value = prefs.setString(saveKey, saveValue);
  if (value != null) {
    return true;
  } else {
    return false;
  }
}

Future<String?> getPic({required String key}) async {
  final prefs = await SharedPreferences.getInstance();
  final getkey = '$key';
  final value = prefs.getString(getkey) ?? null;
  print("THIS IS Pic IN SPREF");
  print(value);
  return value;
}
