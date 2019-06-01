import 'package:flutter/material.dart';

class Colors {
  const Colors();

  static const Color jobCard = const Color(0xFF8685E5);
  static const Color jobPageBackground = const Color(0xFFFFFFFF);
  static const Color jobTitle = const Color(0xFFFFFFFF);
  static const Color jobDescription = const Color(0x66FFFFFF);
  static const Color jobLocation = const Color(0x66FFFFFF);
  static const Color background = const Color(0x66E7E8EC);
  static const Color shadowColor = const Color(0xFF000000);
}

class TextStyles {
  const TextStyles();

  static const TextStyle jobTitle = const TextStyle(
      color: Colors.jobTitle,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 14.0);

  static const TextStyle jobLocation = const TextStyle(
      color: Colors.jobLocation,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 9.0);

  static const TextStyle jobDescription = const TextStyle(
      color: Colors.jobDescription,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 14.0);
}

class BoxShadows {
  const BoxShadows();

  static const BoxShadow boxShadow = const BoxShadow(
      color: Colors.shadowColor,
      blurRadius: 2.0,
      offset: const Offset(1.0, 2.0));
}
