import 'package:flutter/material.dart';


Align buildAlignNav(String page) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
        color: Color(0xFFFFAD2A),
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildAltNav(iconData: Icons.home_filled, active: page == "home"),
            buildAltNav(iconData: Icons.search, active: page == "search"),
            buildAltNav(iconData: Icons.shopping_basket, active: page == "cart" ),
            buildAltNav(iconData: Icons.person, active: page == "profile"),
          ],
        )),
  );
}

Widget buildAltNav({required IconData iconData, required bool active}) {
  return Icon(iconData,
      size: 24, color: Color(active ? 0xFFFFFFFF : 0x8b451300));
}

Widget headerPage(String title,context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    //geri ikonu
    GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back,
        color: Color.fromRGBO(69, 19, 0, 0.7411764705882353),
        size: 32,
      ),
    ),
    const SizedBox(
      height: 24,
    ),
    Text(
      title,
      style: TextStyle(
        color: Color.fromRGBO(69, 19, 0, 0.7411764705882353),
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
        SizedBox(
          height: 12,
        )
  ]);
}

Container smallcont(String discount) {
  return Container(
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(2),
      color: const Color(0xFFFFAD2A),
    ),
    child: Text(
      discount,
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: Colors.red,
          fontSize: 18,
          fontWeight: FontWeight.w500),
    ),
  );
}