import 'package:flutter/material.dart';

enum Menu { main, dart, tab }

extension MenuExtension on Menu {
  String get name {
    switch (this) {
      default:
        return this.toString().split(".")[1];
    }
  }

  void move(context) {
    if (name == "main") {
      Navigator.of(context).pushNamed("/");
      return;
    }

    Navigator.of(context).pushNamed("/${this.name}");
  }
}
