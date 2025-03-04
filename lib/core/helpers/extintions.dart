import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName) async {
    return Navigator.of(this).pushNamed(routeName, arguments: this);
  }

  Future<dynamic> pushReplacementNamed(String routeName) async {
    return Navigator.of(this).pushReplacementNamed(routeName, arguments: this);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName) async {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  void pop() async {
    Navigator.of(this).pop();
  }
}
