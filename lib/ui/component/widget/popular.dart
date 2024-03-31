import 'package:flutter/material.dart';

Widget PopularWidget(String img, String judul, String harga, context) {
    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;


  print(img);
  print(judul);
  print(harga);
  
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: tinggi * 0.3,
              width: lebar * 0.4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(img),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(18)),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 148),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: Icon(
                Icons.favorite_border,
              ),
            )
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          width: 156,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                judul,
                // maxLines: 2,
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 9,
              ),
              Text(
                harga,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
              )
            ],
          ),
        )
      ],
    ),
  );
}
