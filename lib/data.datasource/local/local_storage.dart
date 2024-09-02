import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import '../../constants/constants.dart';


class LocalStorage {
  static final box = GetStorage();


  static void writeString(String key, String v) {
    box.write(key, v);
  }

  static String getString(String key) {
    return box.read(key) ?? "";
  }

  static void writeBool(String key, bool v) {
    box.write(key, v );
  }

  static bool getBool(String key) {
    return box.read(key) ?? false;
  }


  static bool savedTheme() {
    return box.read(GetXStorageConstants.darkTheme) ?? false;
  }

  ThemeMode getTheme() {
    return savedTheme() ? ThemeMode.light : ThemeMode.dark;
  }

  void saveTheme(bool v) {
    box.write(GetXStorageConstants.darkTheme, v);
  }

  void changeTheme() {
    Get.changeThemeMode(savedTheme() ? ThemeMode.dark : ThemeMode.light);
    saveTheme(!savedTheme());
  }

  static void clearValueByKey(String key) {
    box.remove(key);
  }

  static void setAuthToken(String token) {
    box.write(GetXStorageConstants.authToken, token);
  }


  static String getAuthToken() {
    return box.read(GetXStorageConstants.authToken) ?? "";
  }

  static void clear() {
    box.erase();
  }
}
