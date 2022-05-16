import 'package:flutter/material.dart';

class GradientBackground {
  static BoxDecoration blueGradient() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: const [0.0, 0.2, 0.4],
        colors: [
          Colors.blue,
          Colors.blue.shade100,
          Colors.white,
        ],
      ),
    );
  }
}
