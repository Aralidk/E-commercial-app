import 'package:flutter/material.dart';
import 'commonwidgets.dart';
import 'category.dart';

class CategoriesPage extends StatelessWidget {
  final List<String> categories = [
    "All",
    "Computers",
    "Accessories",
    "Smartphones",
    "Smart Objects",
    "Speakers",
    "Televisions",
    "Personal Care",
    "Others",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
        Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        child:Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //header
          headerPage("Categories", context),
          //kategoriler
          Expanded(
            child: ListView(
              children: categories
                  .map((String title) => buildCategories(title, context))
                  .toList(),
            ),
          ),

        ]),
      ),
          buildAlignNav("search"),
    ])));
  }

  Widget buildCategories(String title, context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CategoryPage(title);
          }));
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 12),
          padding: EdgeInsets.all(24),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0x54FFAD2A),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color.fromRGBO(69, 19, 0, 0.7411764705882353),
            ),
          ),
        ));
  }
}
