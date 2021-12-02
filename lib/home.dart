import 'package:e_ticaret/categories.dart';
import 'package:flutter/material.dart';
import 'commonwidgets.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [ Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: ListView(
                children: [
                  //baslık
                  buildBaslik(),
                  //banner
                  buildBanner(),
                  //butonlar
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildButon(
                          icon: Icons.menu,
                          text: "Categories",
                          context: context,
                          widget: CategoriesPage(),
                        ),
                        buildButon(
                          icon: Icons.card_giftcard,
                          text: "Gifts",
                        ),
                        buildButon(
                          icon: Icons.people,
                          text: "Best Selling",
                        ),
                        buildButon(
                          icon: Icons.star,
                          text: "Favorites",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  //satıslar
                  const Text(
                    "Sales",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Color.fromRGBO(69, 19, 0, 0.7411764705882353),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),

                  //satıslar column
                  buildRow(screenWidth),
                  const SizedBox(
                    height: 12,
                  ),
                  buildRow(screenWidth),
                  SizedBox(height: 72),

                ],
              ),
            ),

              //alt navigasyon
              buildAlignNav("home")
          ]
          ),

        ));
  }


  Row buildRow(double screenWidth) {
    return Row(
                children: [
                  satisurunleri(
                      screenWidth: screenWidth,
                      text: "Smart Phones",
                      discount: "-%50",
                      photoUrl: "assets/telefonAnasayfa.png"),
                  SizedBox(
                    width: 20,
                  ),
                  satisurunleri(
                      screenWidth: screenWidth,
                      text: "Monitors",
                      photoUrl: "assets/monitor.png",
                      discount: "-%30")
                ],
              );
  }
}

Container satisurunleri(
    {required String text,
      required String photoUrl,
      required String discount,
      required double screenWidth,}) {
  return Container(
    width: (screenWidth - 60) * 0.5,
    decoration: BoxDecoration(
        color:  Color(0x54FFAD2A), borderRadius: BorderRadius.circular(12)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //%50
        smallcont("-50%"),
        const SizedBox(
          height: 12,
        ),
        // telefon resmi
        Image.asset(photoUrl),
        const SizedBox(height: 12),
        Text(
          text,
          style: const TextStyle(
            color: Color.fromRGBO(69, 19, 0, 0.7411764705882353),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ),
  );
}



Widget buildButon(
    {required String text,
      required IconData icon,
      Widget? widget,
      BuildContext? context,
    }) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context!, MaterialPageRoute(builder: (context) {
        return widget!;
      }));
    },
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 22),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFFFAD2A),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 18,
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(69, 19, 0, 0.7411764705882353),
          ),
        ),
      ],
    ),
  );
}

Padding buildBanner() {
  return Padding(
    // ignore: prefer_const_constructors
    padding: EdgeInsets.only(top: 20.0),
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
          color: const Color(0xFFFFAD2A), borderRadius: BorderRadius.circular(6.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: const [
              Text(
                "Home Speaker",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 6),
              Text(
                "USD 150",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
          Image.asset(
            "assets/speaker.png",
          ),
        ],
      ),
    ),
  );
}

Text buildBaslik() {
  return const Text(
    "Home",
    // ignore: prefer_const_constructors
    style: TextStyle(
      fontSize: 32,
      // ignore: prefer_const_constructors
      color: Color.fromRGBO(69, 19, 0, 0.7411764705882353),
      fontWeight: FontWeight.bold,
    ),
  );
}

