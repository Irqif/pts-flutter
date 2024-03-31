import 'package:flutter/material.dart';
import 'package:uts_fultter_2/ui/component/KategoriPage.dart';
import 'package:uts_fultter_2/ui/component/HomePage.dart';
import 'package:uts_fultter_2/ui/component/detailProduk.dart';
import 'package:uts_fultter_2/ui/component/popularPage.dart';
import 'package:uts_fultter_2/ui/component/searchPage.dart';
import 'package:uts_fultter_2/ui/home.dart';
import 'package:uts_fultter_2/ui/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 2)),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'flutter demo',
            routes: {
              '/': (context) => Home(),
              '/splash': (context) => SplashScreen(),
              '/homePage': (context) => HomePage(),
              '/kategoriPage': (context) => KatetoriPage(),
              '/detail': (context) => DetailProduk(),
              '/search': (context) => SearchPage(),
              '/popular': (context) => PopularProduct()
            },
          );
        }
        return SplashScreen();
      },
    );
  }
}

