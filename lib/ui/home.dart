import 'package:flutter/material.dart';
import 'package:uts_fultter_2/ui/component/KategoriPage.dart';
import 'package:uts_fultter_2/ui/component/HomePage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:uts_fultter_2/ui/component/searchPage.dart';


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int menu = 0;
  List lsMenu = [HomePage(), SearchPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: lsMenu[menu],
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: GNav(
            tabBackgroundColor: Colors.black,
            activeColor: Colors.white,
            padding: EdgeInsets.all(10),
            gap: 8,
            onTabChange: (value) {
              setState(() {
                menu = value;
              });
            },
            tabs: [
              GButton(icon: Icons.home, text: "Home"),
              GButton(icon: Icons.search, text: "Search"),
              GButton(icon: Icons.favorite, text: "Favorit"),
              GButton(icon: Icons.person, text: "Profile"),
            ]),
      ),
    );
  }
}