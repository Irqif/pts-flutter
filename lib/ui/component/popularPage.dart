import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uts_fultter_2/ui/component/widget/popular.dart';

class PopularProduct extends StatefulWidget {
  @override
  State<PopularProduct> createState() => _PopularProductState();
}

class _PopularProductState extends State<PopularProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.black,
        title: IconButton(
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context, '/homePage', (route) => false),
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
        child: ListView(
          children: [
            Wrap(
              spacing: 30,
              children: [
                Container(
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/detail'),
                    child: PopularWidget('assets/img/jas.jpeg', 'AC/DC North \n American T-Shirt', 'Rp 500.000', context)
                  ),
                ),
                Container(
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/detail'),
                    child: PopularWidget('assets/img/jas.jpeg', 'AC/DC North \n American T-Shirt', 'Rp 500.000', context)
                  ),
                ),
                Container(
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/detail'),
                    child: PopularWidget('assets/img/jas.jpeg', 'AC/DC North \n American T-Shirt', 'Rp 500.000', context)
                  ),
                ),
                Container(
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/detail'),
                    child: PopularWidget('assets/img/jas.jpeg', 'AC/DC North \n American T-Shirt', 'Rp 500.000', context)
                  ),
                ),
                Container(
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/detail'),
                    child: PopularWidget('assets/img/jas.jpeg', 'AC/DC North \n American T-Shirt', 'Rp 500.000', context)
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}