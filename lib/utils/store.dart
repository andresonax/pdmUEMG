import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Store {
  static Future<void> saveString(String key, String value) async {
    final preferencias = await SharedPreferences.getInstance();
    preferencias.setString(key, value);
  }

  static Future<void> saveMap(String key, Map<String, dynamic> value) async {
    saveString(key, json.encode(value));
  }

  static Future<bool> remover(String key) async {
    final preferencias = await SharedPreferences.getInstance();
    return preferencias.remove(key);
  }

  static Future<String> getString(String key) async {
    final preferencias = await SharedPreferences.getInstance();
    return preferencias.getString(key);
  }

  static Future<Map<String, dynamic>> getMap(String key) async {
    try {
      Map<String, dynamic> map = json.decode(await getString(key));
      return map;
    } catch (_) {
      return null;
    }
  }
}
