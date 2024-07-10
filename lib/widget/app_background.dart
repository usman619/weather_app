import 'dart:ui';

import 'package:flutter/material.dart';

Widget appBackground() {
  return Stack(
    children: [
      Align(
        alignment: const AlignmentDirectional(9, -0.3),
        child: Container(
          height: 300,
          width: 300,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.deepPurple,
          ),
        ),
      ),
      Align(
        alignment: const AlignmentDirectional(-9, -0.3),
        child: Container(
          height: 300,
          width: 300,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.deepPurple,
          ),
        ),
      ),
      Align(
        alignment: const AlignmentDirectional(0, -1.2),
        child: Container(
          height: 300,
          width: 600,
          decoration: BoxDecoration(
            color: Colors.yellow.shade800,
          ),
        ),
      ),
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
        child: Container(
            decoration: const BoxDecoration(color: Colors.transparent)),
      ),
    ],
  );
}
