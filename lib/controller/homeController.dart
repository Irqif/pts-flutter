// import 'dart:convert';
// import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:uts_fultter_2/model/model.dart';


class HomeController {
  Future getProduct(String categoryId, int priceMin, int priceMax) async {
      String url = "https://api.escuelajs.co/api/v1/products/?q=efd93517c2177f923f7b55f4d26bc4bdlimit=0&categoryId=$categoryId&price_min=$priceMin&price_max=$priceMax";
      Uri urlData = Uri.parse(url);

      print('inir url $urlData');

      final response =  await http.get(urlData);
      print('oooo ${response.body}');
      print('ini response $response');
      print(response.statusCode);


      // print(data);

      if(response.statusCode == 200) {
        List<Product> products = productFromJson(response.body.toString());
        List<Product> dup = productFromJson(response.body.toString());

        for (int i = 0; i < dup.length; i++) {
          // print(dup[i].images);
          if (dup[i].images.length == 1) {
            if (dup[i].images.first[0] == "[") {
              var end = dup[i].images.first.indexOf('"]');
              dup[i].images.first = dup[i].images.first.substring(2, end);
              print(dup[i].images);
            } else {
              print("tidak");
            }
          }
        }

        return dup;
      } else {
        throw Exception('gagal mengambil data');
      }
  }

  Future getCategory() async {
      String url = "https://api.escuelajs.co/api/v1/categories/?q=efd93517c2177f923f7b55f4d26bc4bd";
      Uri urlData = Uri.parse(url);

      print('inir url $urlData');

      final response =  await http.get(urlData);
      // print(response.body);
      print('ini response $response');
      print(response.statusCode);


      // print(data);

      if(response.statusCode == 200) {
        List<Kategory> data= kategoryFromJson(response.body.toString());
        print(data);
        return data;
      } else {
        throw Exception('gagal mengambil data');
      }
  }
}