import 'package:flutter/material.dart';
import 'commonwidgets.dart';

class productDetail extends StatefulWidget {
  String productTitle;
  productDetail(this.productTitle);

  @override
  _productDetailState createState() => _productDetailState();
}

class _productDetailState extends State<productDetail> {
  Color selectedColor = Color(0xFFFF0000);
  int selectedCapacity = 64;

  List<Color> colors = [
    Color(0xFFFF0000),
    Color(0xFF2A85AB),
    Color(0xFF000000),
    Color(0xFFFFFF),
  ];

  List<int> capacities = [64, 256, 512];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      buildAlignNav("cart"),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(children: [
                  headerPage(widget.productTitle, context),
                  const SizedBox(
                    height: 16,
                  ),
                  smallcont("New"),
                  SizedBox(height: 25),
                  Image.asset(
                    "assets/laptop/laptopDetay.png",
                  ),
                  const Text(
                    "Color",
                    style: TextStyle(
                      color: Color.fromRGBO(69, 19, 0, 0.7411764705882353),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: colors
                        .map((Color color) => colorOption(
                            color: color,
                            selected: selectedColor == color,
                            set: () {
                              setState(() {
                                selectedColor = color;
                              });
                            }))
                        .toList(),
                  ),
                  SizedBox(height: 24),
                  const Text(
                    "Capacity",
                    style: TextStyle(
                      color: Color.fromRGBO(69, 19, 0, 0.7411764705882353),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: capacities
                        .map((int number) => capacityOption(
                            capacity: number,
                            selectedCap: selectedCapacity == number,
                            ontap: () {
                              setState(() {
                                selectedCapacity = number;
                              });
                            }))
                        .toList(),
                  ),
                  SizedBox(height: 24),
                  GestureDetector(
                    onTap: (){
                      print("Product added to cart");
                      print("Product name: " + widget.productTitle);
                      print("Colors of product: " + selectedColor.value.toString());
                      print("Capacity of product: " + selectedCapacity.toString()+ " gb");
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                          color: Color(0xFFFFAD2A),
                          borderRadius: BorderRadius.circular(6)),
                      child: Text(
                        "Add To Cart",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(69, 19, 0, 0.7411764705882353),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 80),
                ]),
              )
            ],
          )),
              buildAlignNav("cart")
    ])));
  }
}

Widget capacityOption(
    {required int capacity, required bool selectedCap, required ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: Text(
      "$capacity gb",
      style: TextStyle(
        color: Color(selectedCap ? 0xFFFFAD2A : 0x45130011),
        fontSize: 18,
      ),
    ),
  );
}

Widget colorOption(
    {required Color color, required bool selected, required set}) {
  return GestureDetector(
    onTap: set,
    child: Container(
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border:
              Border.all(color: Color(0xFFFFAD2A), width: selected ? 3 : 0)),
      width: 23,
      height: 23,
    ),
  );
}
