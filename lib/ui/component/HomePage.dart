import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uts_fultter_2/controller/homeController.dart';
import 'package:uts_fultter_2/model/model.dart';
import 'package:uts_fultter_2/ui/component/widget/kategori.dart';
import 'package:uts_fultter_2/ui/component/widget/popular.dart';
// import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String category = '';
  int pricemin = 0;
  int pricemax = 0;

  @override
  Widget build(BuildContext context) {
    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      child: Image.asset('assets/img/user.png'),
                    ),
                    SizedBox(width: 3,),
                    Text('User', style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                    ),)
                  ],
                ),
                SizedBox(height: 24,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(  
                      padding: EdgeInsets.only(left: 10, top: 11),                    
                      width: lebar * 0.7,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey)
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/search'),
                        child: Text('Search Product',style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey
                        ),)
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.shopping_cart,color: Colors.white60,),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.notifications,color: Colors.white60,),
                    ),
                  ],
                ),
                SizedBox(height: 24,),
                Container(
                  width: lebar,
                  padding: EdgeInsets.only(left: 25, top: 25, bottom: 25),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(135, 60, 9, 69),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('A Summer Surpice',style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                      ),),
                      Text('Cashback 20%', style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.white
                      ),)
                    ],
                  ),
                ),
                SizedBox(height: 28,),
                FutureBuilder(
                  future: HomeController().getCategory(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      List<Kategory> data = snapshot.data;

                      return Container(
                          margin: EdgeInsets.only(bottom: tinggi * 0.03),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Wrap(
                                spacing: 20,
                                children: List.generate(data.length, (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        category = data[index].id.toString();
                                      });
                                    },
                                    child: CategoryWidget(data[index].name,
                                        data[index].image, lebar, tinggi),
                                  );
                                })),
                          ));
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
                  },
                ),
                SizedBox(height: 24,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Popular Product',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                    ),),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/popular'),
                      child: Text('See More',style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[500],
                        fontSize: 15
                      ),),
                    )
                  ],
                ),
                SizedBox(height: 18,),
                Container(
                  child: FutureBuilder(
                    future: HomeController().getProduct(category,pricemin, pricemax), 
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
        ],
      ),
    );
  }
}