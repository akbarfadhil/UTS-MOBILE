import 'package:flutter/material.dart';

class UserService {
  static ValueNotifier<String> userName = ValueNotifier('Akbar');
  static String userEmail = 'akbarfadhil11@gmail.com';

  static void updateName(String newName) {
    userName.value = newName;
  }
}
