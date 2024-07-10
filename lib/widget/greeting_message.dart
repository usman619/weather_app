import 'package:flutter/material.dart';

Widget getGreeting(int hour) {
  String greeting;
  if (hour < 12) {
    greeting = 'Good Morning 🌅';
  } else if (hour < 17) {
    greeting = 'Good Afternoon 🌞';
  } else if (hour < 20) {
    greeting = 'Good Evening 🌇';
  } else {
    greeting = 'Good Night 🌜';
  }

  return Text(greeting,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ));
}
