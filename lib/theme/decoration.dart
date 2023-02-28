import 'package:flutter/material.dart';

BoxDecoration shadowdecoration = BoxDecoration(
  color: Colors.white,
  // border: Border.all(width: 1, color: Colors.grey),
  borderRadius: BorderRadius.circular(10),
  boxShadow: const [
    BoxShadow(
        color: Color(
          0x3f000000,
        ), //New
        blurRadius: 1.0,
        offset: Offset(0, 0))
  ],
);

TextStyle text18_400 = const TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w400,
);

TextStyle text20_400 = const TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w400,
);
