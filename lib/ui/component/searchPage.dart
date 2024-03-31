import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uts_fultter_2/controller/homeController.dart';
import 'package:uts_fultter_2/model/model.dart';
import 'package:uts_fultter_2/ui/component/widget/kategori.dart';
import 'package:uts_fultter_2/ui/component/widget/popular.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  List<Product> display_products = [];
  String _searchQuery = '';
  String category ='';
  int pricemin = 0;
  int pricemax = 0;

      void showFilterDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoTextField(
                placeholder: 'Minimum Price',
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    pricemin = int.tryParse(value) ?? 0;
                  });
                },
              ),
              const SizedBox(height: 10),
              CupertinoTextField(
                placeholder: 'Maximum Price',
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    pricemax = int.tryParse(value) ?? 0;
                  });
                },
              ),
            ],
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            CupertinoDialogAction(
              onPressed: () {
                setState(() {
                  HomeController()
                      .getProduct(category, pricemin, pricemax);
                });
                Navigator.pop(context);
              },
              child: const Text('Filter'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;
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
          padding: EdgeInsets.symmetric(horizontal: 14,vertical: 18),
          child: ListView(
            children: [
              Container(
                width: lebar * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey)
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search Products',
                    suffixIcon: Icon(Icons.search),
                    hintStyle: TextStyle(fontSize: 18),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,)
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  showFilterDialog(context);
                },
                icon: const Icon(CupertinoIcons.slider_horizontal_3),
              ),
              // SizedBox(height: 24,),
              Padding(
                padding: const EdgeInsets.only(top: 24, left: 30),
                child:Container(
                  child: FutureBuilder(
                    future: HomeController().getProduct(category,pricemin, pricemax), 
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        List<Product> data = snapshot.data;
                        print('ini adalah data ${data}');
                        print(snapshot.data);
                        List<Product> filteredData = data
                          .where((product) => product.title
                              .toLowerCase()
                              .contains(_searchQuery.toLowerCase()))
                          .toList();
                  
                        return Container(
                          margin: EdgeInsets.only(bottom: tinggi * 0.03),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Wrap(
                              spacing: 5,
                              children: List.generate(filteredData.length, (index) {
                                return GestureDetector(
                                  onTap: () => Navigator.pushNamed(context, '/detail', arguments: filteredData[index]),
                                  child: PopularWidget(filteredData[index].images[0], filteredData[index].title, filteredData[index].price.toString(), context,)
                                );
                              }),
                            ),
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
              )
            ],
          ), 
        ),
    );
  }
}