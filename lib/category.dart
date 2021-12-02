import 'package:e_ticaret/productdetail.dart';
import 'package:flutter/material.dart';
import 'commonwidgets.dart';

class CategoryPage extends StatelessWidget {
  String categoryTitle;
  CategoryPage(this.categoryTitle);

  final List<Map> products = [
    {
      "isim": "Surface laptop 1",
      "fotograf": "assets/laptop/laptop1.png",
      "fiyat": "Usd 999",
    },
    {
      "isim": "Surface laptop 2",
      "fotograf": "assets/laptop/laptop2.png",
      "fiyat": "Usd 1999"
    },
    {
      "isim": "Surface laptop 3",
      "fotograf": "assets/laptop/laptop3.png",
      "fiyat": "Usd 4999",
    },
    {
      "isim": "Surface laptop 4",
      "fotograf": "assets/laptop/laptop4.png",
      "fiyat": "Usd 599",
    },
    {
      "isim": "Surface laptop 5",
      "fotograf": "assets/laptop/laptop5.png",
      "fiyat": "Usd 799",
    },
    {
      "isim": "Surface laptop 6",
      "fotograf": "assets/laptop/laptop6.png",
      "fiyat": "Usd 2999",
    },
    {
      "isim": "Surface laptop 6",
      "fotograf": "assets/laptop/laptop6.png",
      "fiyat": "Usd 2999",
    },
    {
      "isim": "Surface laptop 6",
      "fotograf": "assets/laptop/laptop6.png",
      "fiyat": "Usd 2999",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                headerPage(categoryTitle, context),
                Expanded(
                  child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 12.0,
              crossAxisSpacing: 12.0,
              children: products.map((Map product) {
                  return buildContainerCategory(
                      product["isim"], product["fotograf"], product["fiyat"], context);
              }).toList(),
                  ),
                ),
          ])),
              buildAlignNav("search"),
    ])));
  }

  Widget buildContainerCategory(String name, String photoUrl, String price, context ) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return productDetail(name);
        }));
      },
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          decoration: BoxDecoration(
              color: Color(0x54FFAD2A), borderRadius: BorderRadius.circular(6)),
          child: Column(
            children: [
              Image.asset(photoUrl),
              Text(
                name,
                style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(69, 19, 0, 0.7411764705882353),
                    fontWeight: FontWeight.w500),
              ),
              Text(
                price,
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ],
          )),
    );
  }
}
