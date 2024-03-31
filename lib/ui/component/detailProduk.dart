// ignore_for_file: unnecessary_const, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';
import 'package:uts_fultter_2/model/model.dart';

class DetailProduk extends StatefulWidget {
  @override
  State<DetailProduk> createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
    // final formatter = NumberFormat.simpleCurrency(locale: 'us_US');p

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    final data = ModalRoute.of(context)!.settings.arguments as Product;
    List<String> images = [];
    if (data.images.length == 1) {
      images.add(data.images[0]);
    }else {
      images.add(data.images[0]);
      images.add(data.images[1]);
      images.add(data.images[2]);
    }

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.black,
          title: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Iconsax.arrow_left,
                color: Colors.white,
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                      weight: 1,
                      size: 25,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 500,
                  aspectRatio: MediaQuery.of(context).size.width,
                  // autoPlay: true,
                  enlargeCenterPage: false,
                  viewportFraction: 1.0,
                ),
                items: images.map((url) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        // margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                        ),
                        child: Image.network(
                          url,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          children: [
                            RichText(
                              text: TextSpan(
                                text:
                                    '${data.description}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff292D32),
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Baca Selengkapnya',
                                    style: TextStyle(
                                      color: Colors
                                          .green, // Ubah warna menjadi hijau
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text(
                              '4.8',
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              '(102) | 67 ulasan',
                              style: TextStyle(color: Color(0xff292D32)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Wrap(
                          spacing: 5,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            CircleAvatar(
                              child: Image.asset('assets/img/user.png'),
                            ),
                            Text(
                              'LapakStore',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            Icon(
                              Icons.verified,
                              size: 20,
                            )
                          ],
                        )
                      ]))
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(top: 16),
          child: Container(
            padding: EdgeInsets.only(top: 26, bottom: 24, right: 24, left: 24),
            decoration:
                BoxDecoration(border: Border.all(color: Color(0xffF2F2F7))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${data.price}',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8)),
                  child: TextButton(
                      onPressed: () {},
                      child: Text('Tambah Keranjang',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white))),
                )
              ],
            ),
          ),
        ));
  }
}
