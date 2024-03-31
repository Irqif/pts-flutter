import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uts_fultter_2/controller/homeController.dart';
import 'package:uts_fultter_2/model/model.dart';
import 'package:uts_fultter_2/ui/component/widget/kategori.dart';
import 'package:uts_fultter_2/ui/component/widget/popular.dart';

class KatetoriPage extends StatefulWidget {
  @override
  State<KatetoriPage> createState() => KatetoriPageState();
}

class KatetoriPageState extends State<KatetoriPage> {
  // String category = '';
  int pricemin = 0;
  int pricemax = 0;

  @override
  Widget build(BuildContext context) {
    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;
    final data = ModalRoute.of(context)!.settings.arguments as Kategory;

    return  Scaffold(
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
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        child: ListView(
          children: [
                Container(
                  child: FutureBuilder(
                    future: HomeController().getProduct(data.id.toString(),pricemin, pricemax), 
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        List<Product> data = snapshot.data;
                        print('ini adalah data ${data}');
                        print(snapshot.data);
                  
                        return Container(
                          margin: EdgeInsets.only(bottom: tinggi * 0.03),
                          child: Wrap(
                            spacing: 10,
                            children: List.generate(data.length, (index) {
                              return GestureDetector(
                                onTap: () => Navigator.pushNamed(context, '/detail', arguments: data[index]),
                                child: PopularWidget(data[index].images[0], data[index].title, data[index].price.toString(), context,)
                              );
                            }),
                          )
                        );
                      } else {
                        return Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: Container(
                                margin: EdgeInsets.only(bottom: tinggi * 0.03),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Wrap(
                                      spacing: 20,
                                      children: List.generate(3, (index) {
                                        return CategoryWidget(
                                            "Category",
                                            "https://i.ibb.co/vPnDfxZ/play-circle.png",
                                            lebar, tinggi);
                                      })),
                                )));
                      }
                    }
                  ),
                ),
          ],
        ),
      ),
    );
  }
}