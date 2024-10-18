import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../coffeeOrder/CoffeeOrder_Screen.dart';
import '../CoffeeShop_screen.dart';


Widget buildProfileSection(Size size) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Icon(Icons.waving_hand, color: Colors.yellow, size: size.width * 0.06),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '20/12/2022',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w300,
                  fontSize: 14.0,
                  color: greycolor,
                  decoration: TextDecoration.none,
                ),
              ),
              Text(
                'Joshua Scanlan',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                  color: greycolor,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
        ],
      ),
      Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            decoration: BoxDecoration(color: const Color.fromRGBO(249, 249, 249, 0.79), borderRadius: BorderRadius.circular(6)),
            child: const Icon(
              CupertinoIcons.delete_simple,
              size: 24,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          CircleAvatar(
            backgroundImage: const AssetImage('assets/images/user.jpg'), // Replace with your asset
            radius: size.width * 0.05,
            // child: Center(child: Image.asset('assets/images/user.jpg' ,fit: BoxFit.cover,)),
          ),
        ],
      ),
    ],
  );
}

Widget buildSearchBar(Size size) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(6),
    ),
    child: Row(
      children: [
        Icon(Icons.search, color: greycolor),
        SizedBox(width: 0),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search favorite Beverages',
              hintStyle: GoogleFonts.inter(
                fontWeight: FontWeight.w300,
                fontSize: 13.0,
                color: greycolor,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
        Icon(Icons.filter_list_rounded, color: greycolor),
      ],
    ),
  );
}
Widget buildInstantCard(BuildContext context,Size size, String title, String imagePath, String rating, int reviews, String description) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: size.height * 0.02, vertical: 10),

    child: ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 14), // Blur effect

        child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> CoffeeOrderScreen()));

          },
          child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(6)),
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12.0, bottom: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '$rating ',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0,
                                color: Color.fromRGBO(29, 29, 29, 1),
                                decoration: TextDecoration.none,
                              ),
                            ),
                            Icon(Icons.star, color: Colors.yellow, size: size.width * 0.04),
                            Text(
                              ' (${reviews.toString()})',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0,
                                color: Color.fromRGBO(29, 29, 29, 1),
                                decoration: TextDecoration.none,
                              ),
                            ),
                            SizedBox(width: 10),
                            Image.asset(
                              "assets/images/veg.png",
                              height: 16,
                              width: 16,
                            )
                          ],
                        ),
                        Text(
                          "Caffè latte is a milk coffee that is a made up of one or two shots of espresso, steamed milk and a final, thin layer of frothed milk on top.",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 13.0,
                            color: Colors.white70,
                            decoration: TextDecoration.none,
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.14,
                  child: Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(12), // Same border radius as the card

                          child: Image.asset(
                            imagePath,
                            height: size.height * 0.12,
                            width: size.height * 0.12,
                            fit: BoxFit.fill,
                          )),
                      Positioned(
                        bottom: 5,
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.bottomCenter, // Center the button horizontally

                          child: Container(
                            width: size.height * 0.06,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                            decoration: BoxDecoration(color: Color.fromRGBO(102, 163, 92, 1), borderRadius: BorderRadius.circular(4)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "ADD",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}



double getImageHeight(Size size) {
  if (kIsWeb) {
    return size.height * 0.15; // Height for web
  } else if (Platform.isAndroid) {
    return size.height * 0.12; // Height for Android
  } else {
    return size.height * 0.12; // Default height for other platforms (e.g. iOS)
  }
}
Widget buildBeverageCard(BuildContext context ,Size size, String title, String imagePath, String rating, int reviews) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10),

    child: ClipRRect(
      borderRadius: BorderRadius.circular(6), // Same border radius as the card

      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 14), // Blur effect

        child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> CoffeeOrderScreen()));

          },
          child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(6)),
            width: size.width * 0.45,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Center(child: Image.asset("assets/images/coffee2.png", height: getImageHeight(size))),
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
                Text(
                  'Espresso, Steamed Milk',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 13.0,
                    color: Color.fromRGBO(29, 29, 29, 1),
                    decoration: TextDecoration.none,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '$rating',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Icon(Icons.star, color: Colors.yellow, size: size.width * 0.04),
                        Text(
                          '(${reviews.toString()})',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    Container(color: Colors.green, child: Icon(Icons.add, color: Colors.white)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}