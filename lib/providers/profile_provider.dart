import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  String name;

  ProfileProvider(this.name);

  void addName(String username) {
    name = username;
  }
}
