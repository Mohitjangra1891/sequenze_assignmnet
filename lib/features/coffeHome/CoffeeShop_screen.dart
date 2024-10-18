import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sequenze_assignmnet/features/coffeHome/widgets/home_widgets.dart';

import '../coffeeOrder/CoffeeOrder_Screen.dart';

const greycolor = Color.fromRGBO(182, 182, 182, 1);
const darkcolor = Color.fromRGBO(48, 48, 48, 1);

class CoffeeShopUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Media Query to handle responsiveness
    var size = MediaQuery.of(context).size;
    double horizontalPadding = size.height * 0.02;
    double verticalPadding = size.height * 0.03;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg.jpg', // Your background image
              fit: BoxFit.cover,
            ),
          ),

          // BackdropFilter applied over the entire screen
          if (!kIsWeb)
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),

          Container(
            height: size.height,
            // decoration: const BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage('assets/images/bg.jpg'),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            // padding: EdgeInsets.symmetric(horizontal: horizontalPadding ,vertical: 40),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 14), // Blur effect

                    child: Container(
                      padding: EdgeInsets.only(left: horizontalPadding, right: horizontalPadding, bottom: 20, top: 60),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                      ),
                      child: Column(
                        children: [
                          buildProfileSection(size),
                          SizedBox(height: verticalPadding),
                          buildSearchBar(size),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(height: size.height*0.01),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: size.height * 0.015),
                    child: Text(
                      'Most Popular Beverages',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                        color: greycolor,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  _buildPopularBeverages(context, size),

                  _buildGetItInstantly(context, size),
                ],
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  double getContainerHeight(Size size) {
    if (kIsWeb) {
      return size.height * 0.32; // Height for web
    } else if (Platform.isAndroid) {
      return size.height * 0.25; // Height for Android
    } else {
      return size.height * 0.25; // Default height for other platforms (e.g. iOS)
    }
  }

  Widget _buildPopularBeverages(BuildContext context, Size size) {
    return SizedBox(
      height: getContainerHeight(size),
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        children: [
          buildBeverageCard(context, size, 'Hot Cappuccino', 'assets/cappuccino.png', '4.9', 458),
          buildBeverageCard(context, size, 'Hot Cappuccino', 'assets/chocolate.png', '4.7', 180),
          buildBeverageCard(context, size, 'Hot Chocolate', 'assets/chocolate.png', '4.7', 120),
          // Add more cards as needed
        ],
      ),
    );
  }

  Widget _buildGetItInstantly(BuildContext context, Size size) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.015,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.height * 0.02, vertical: size.height * 0.01),
            child: Text(
              'Get it instantly',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
                color: greycolor,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          buildInstantCard(context, size, 'Lattè', 'assets/images/coffee.png', '4.9', 458, 'Caffè latte is a coffee...'),
          buildInstantCard(context, size, 'Flat White', 'assets/images/cap.png', '4.8', 340, 'A rich espresso...'),
          buildInstantCard(context, size, 'Flat White', 'assets/images/cap.png', '4.8', 340, 'A rich espresso...'),
          buildInstantCard(context, size, 'Flat White', 'assets/images/cap.png', '4.8', 340, 'A rich espresso...'),
          buildInstantCard(context, size, 'Flat White', 'assets/images/cap.png', '4.8', 340, 'A rich espresso...'),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Color(0xFF2C2C2E),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.white), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.favorite, color: Colors.white), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart, color: Colors.white), label: ''),
      ],
    );
  }
}
