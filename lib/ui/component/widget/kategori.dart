import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

Widget CategoryWidget(String name, String img, lebar, tinggi) {
  return Stack(
    children: [
      Container(
        height: tinggi * 0.05,
        width: lebar * 0.3,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20)),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
        child: Center(
          child: Text(name,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.white)),
        ),
      ),
    ],
  );
}
