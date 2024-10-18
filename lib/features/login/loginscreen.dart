import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../coffeHome/CoffeeShop_screen.dart';

class login_screen extends StatelessWidget {
  const login_screen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/bg.jpg'),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                transform: GradientRotation(1.570796),
                stops: [0.0, 1.0],
                colors: [Color.fromRGBO(80, 114, 235, 0.0), Color.fromRGBO(207, 123, 75, 0.2099999904632568)],
              ),
            ),
          ),
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 14),
              child: Center(
                  child: SingleChildScrollView(
                    child: Container(
                      height: screenHeight * 0.86,
                      width: screenWidth * 0.84,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        border: Border.all(color: Colors.white.withOpacity(0.3)), // Optional border
            
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(17.0),
                            topRight: Radius.circular(17.0),
                            bottomLeft: Radius.circular(17.0),
                            bottomRight: Radius.circular(17.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          Image.asset(
                            "assets/images/logo.png",
                            height: 80,
                            width: 80,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: '''Swift\n''',
                              style: GoogleFonts.raleway().copyWith(
                                fontSize: 60,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.none,
                              ),
                              children: [
                                TextSpan(
                                  text: "Café",
                                  style: GoogleFonts.raleway().copyWith(
                                    fontSize: 38,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.005,
                          ),
                          Text(
                            "\"Latte but never late\"",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              shadows: [
                                BoxShadow(
                                  color: Color.fromRGBO(255, 255, 255, 0.8700000047683716),
                                  offset: Offset(0.0, 0.0),
                                  spreadRadius: 0.0,
                                  blurRadius: 20.0,
                                )
                              ],
                              fontSize: 16.0,
                              color: Color.fromRGBO(171, 171, 171, 1.0),
                              decoration: TextDecoration.none,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: screenHeight * 0.04,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.03, vertical: screenHeight * 0.00),
                            child: TextField(
                              cursorColor: Colors.black87,
                              decoration: InputDecoration(
                                hintText: "User Name",
                                filled: true,
                                fillColor: Colors.transparent,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 1), // Bottom line color and width when enabled
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 1), // Bottom line color and width when focused
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white), // Default bottom line color
                                ),
                                hintStyle: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0,
                                color: Colors.white,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.03),
                            child: TextField(
                              cursorColor: Colors.black87,
                              decoration: InputDecoration(
                                hintText: "Password",
                                filled: true,
                                fillColor: Colors.transparent,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 1), // Bottom line color and width when enabled
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 1), // Bottom line color and width when focused
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white), // Default bottom line color
                                ),
                                hintStyle: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0,
                                color: Colors.white,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.08,
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(horizontal: screenHeight * 0.06),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                transform: GradientRotation(-0.003673),
                                stops: [0.0, 1.0],
                                colors: [Color.fromRGBO(77, 43, 26, 1.0), Color.fromRGBO(167, 116, 90, 1.0)],
                              ),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  offset: Offset(2.0, 2.0),
                                  spreadRadius: -2.0,
                                  blurRadius: 12.0,
                                )
                              ],
                            ),
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> CoffeeShopUI()));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent, // Set background to transparent
                                  shadowColor: Colors.transparent, // Remove shadow
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01, horizontal: screenHeight * 0.00),
                                  child: Text(
                                    "Login",
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(horizontal: screenHeight * 0.06),
                            padding: EdgeInsets.only(top: screenHeight * 0.04, bottom: screenHeight * 0.04),
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent, // Transparent background
                                  shadowColor: Colors.transparent, // No shadow
                                  side: BorderSide(color: Colors.white, width: 1), // Outline border color and width
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25), // Optional: Rounded corners
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01, horizontal: screenHeight * 0.00),
                                  child: Text(
                                    "SignUp",
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                          ),
                          Text(
                            "Privacy Policy",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ),
          ),
        ],
      ),
    );
  }
}
