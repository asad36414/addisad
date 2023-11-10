import 'package:addisad/screens/product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopularItemsWidget extends StatelessWidget {
  List itemsTitle = [
    "Black flat screen TV",
    "Mobile Phones Fingerprint vivo",
    "New Car for Sell",
    "Bicycles for daily life",
  ];

  List itemsImages = [
    "LCD.png",
    "Smartphone.png",
    "Cars.png",
    "Bicycles.png",
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = (screenWidth - 40) / 2; // Adjust as needed

    return SingleChildScrollView(
      child: Container(
        height: 240, // Provide a fixed height
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            for (int index = 0; index < itemsTitle.length; index++)
              Container(
                width: itemWidth,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductScreen(),
                            ));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/${itemsImages[index]}",
                          height: itemWidth * 0.75, // Adjust the aspect ratio
                        ),
                      ),
                    ),
                    Text(
                      itemsTitle[index],
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$10",
                          style: TextStyle(
                            fontSize: 17,
                            color: Color(0xFFFE805F),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          CupertinoIcons.add,
                          color: Color(0xFFFE805F),
                          size: 26,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
