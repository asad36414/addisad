import 'package:addisad/admin/screens/add_post.dart';
import 'package:addisad/screens/widgets/popular_items_widget.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List images = [
    'assets/Banner1.jpg',
    'assets/Banner2.jpg',
    'assets/Banner3.jpg',
  ];
  final List promotions = [
    'assets/Promtion1.jpg',
    'assets/Promotion2.jpg',
    'assets/Promtion1.jpg',
  ];
  int _currentIndex = 0;

  final CarouselController controller = CarouselController();

  Widget buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: images.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () {
            controller.jumpToPage(entry.key);

            setState(() {
              _currentIndex = entry.key;
            });
          },
          child: Container(
            width: 10,
            height: 10,
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  _currentIndex == entry.key ? Color(0xFFFE805F) : Colors.white,
            ),
          ),
        );
      }).toList(),
    );
  }

  List category = [
    "Cars",
    "House",
    "Electronics",
    "Jobs",
  ];
  List subcategories = [
    "Groceries",
    "Beverages",
    "Home Appliances",
    "Kitchen & Dinning",
    "Cleaning & Laundry",
    "Stationaries",
    "Speakers",
    "Smartphones",
    "Televisions",
    "Vehicles",
    "Laptops",
    "Bicycles",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Image.asset(
                      "assets/ADDISAD logo.png",
                      height: 50,
                      width: 50,
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage("assets/profile.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                          left: 40,
                          child: Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 3),
                              color: Color(0xFFFE805F),
                              shape: BoxShape.circle,
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.4,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Color(0xFFF3F3F3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search your food here...",
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Color(0xFFFE805F),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.filter_list,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(15),
            //     child: Image.asset("assets/banner.png"),
            //   ),
            // ),
            Stack(
              children: [
                CarouselSlider.builder(
                  carouselController: controller,
                  itemCount: images.length,
                  itemBuilder: (context, index, realIndex) {
                    final image = images[index];
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                      viewportFraction: 1,
                      height: MediaQuery.of(context).size.height * 0.25,
                      initialPage: 0,
                      reverse: false,
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      }),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 10,
                  child: buildIndicator(),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See All",
                      style: TextStyle(
                        color: Color(0xFFFE805F),
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: category.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    margin: EdgeInsets.only(left: 15),
                    padding: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          "assets/${category[index]}.png",
                          height: 80,
                          width: 80,
                        ),
                        Text(
                          category[index],
                          style: TextStyle(
                            fontSize: 16,
                            // color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
       

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See All",
                      style: TextStyle(
                        color: Color(0xFFFE805F),
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Popular category Widget
            PopularItemsWidget(),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Promotions",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See All",
                      style: TextStyle(
                        color: Color(0xFFFE805F),
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: promotions.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    margin: EdgeInsets.only(left: 15),
                    padding: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      "${promotions[index]}",
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Newest Items",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See All",
                      style: TextStyle(
                        color: Color(0xFFFE805F),
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            PopularItemsWidget(),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
