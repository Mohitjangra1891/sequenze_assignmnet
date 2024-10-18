import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sequenze_assignmnet/features/coffeeOrder/widgets/dropdown.dart';

class CoffeeOrderScreen extends StatefulWidget {
  @override
  _CoffeeOrderScreenState createState() => _CoffeeOrderScreenState();
}

class _CoffeeOrderScreenState extends State<CoffeeOrderScreen> {
  // State variables for selections
  String selectedCupFilling = 'Full'; // Default for Choice of Cup Filling
  Set<String> selectedMilkOptions = {}; // Set to keep track of multiple milk selections
  Set<String> selectedSugarOptions = {}; // Set to keep track of multiple sugar selections
  bool highPriority = false; // Checkbox for high priority

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Section with Coffee Image
            Stack(
              children: [
                Container(
                  width: double.infinity, // Ensure the container takes the full width
                  child: AspectRatio(
                    aspectRatio: 6 / 5, // Replace with your image's aspect ratio
                    child: Image.asset(
                      'assets/images/coffee.png',
                      fit: BoxFit.fill, // Ensure it covers the entire width, cropping the height if necessary
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),

            // Coffee Details
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Coffee Title and Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Latté',
                            style: GoogleFonts.inter(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            children: [
                              Text('4.9', style: TextStyle(color: Colors.white)),
                              SizedBox(width: 5),
                              Icon(Icons.star, color: Colors.amber, size: 20),
                              SizedBox(width: 5),
                              Text('(1458)', style: TextStyle(color: Colors.grey)),
                              SizedBox(width: 10),
                              Image.asset(
                                "assets/images/veg.png",
                                height: 16,
                                width: 16,
                              )
                            ],
                          ),
                        ],
                      ),
                      CustomPopupDropdown()
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Caffè latte is a milk coffee that is a made up of one or two shots of espresso, steamed milk and a final, thin layer of frothed milk on top.',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Color.fromRGBO(192, 192, 192, 1),
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.ellipsis, // Show ellipsis (...) if text exceeds the 3 lines

                    softWrap: true,
                    maxLines: 3,
                  ),
                  SizedBox(height: 20),

                  // Choice of Cup Filling
                  _buildChoiceOption(
                    'Choice of Cup Filling',
                    ['Full', '1/2 Full', '3/4 Full', '1/4 Full'],
                    selectedCupFilling,
                    (selectedOption) {
                      setState(() {
                        selectedCupFilling = selectedOption;
                      });
                    },
                  ),
                  SizedBox(height: 12),

                  // Choice of Milk
                  _buildToggleChoice(
                    'Choice of Milk',
                    ['Skim Milk', 'Almond Milk', 'Soy Milk', 'Lactose Free Milk', 'Full Cream Milk', 'Oat Milk', "Lactose Free Milk"],
                    selectedMilkOptions,
                    (option, selected) {
                      setState(() {
                        if (selected) {
                          selectedMilkOptions.add(option);
                        } else {
                          selectedMilkOptions.remove(option);
                        }
                      });
                    },
                  ),
                  SizedBox(height: 12),

                  // Choice of Sugar
                  _buildToggleChoice(
                    'Choice of Sugar',
                    ['Sugar X1', 'Sugar X2', '½ Sugar', 'No Sugar'],
                    selectedSugarOptions,
                    (option, selected) {
                      setState(() {
                        if (selected) {
                          selectedSugarOptions.add(option);
                        } else {
                          selectedSugarOptions.remove(option);
                        }
                      });
                    },
                  ),

                  SizedBox(height: 20),

                  // High Priority Toggle and Submit Button
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(color: Color.fromRGBO(51, 51, 51, 0.84), borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: highPriority,
                            onChanged: (value) {
                              setState(() {
                                highPriority = value ?? false;
                              });
                            },
                            activeColor: Color.fromRGBO(55, 173, 84, 1),
                            side: BorderSide(color: Colors.white, width: 1),
                            // Set the border color to white
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3), // Adjust the corner radius for rounded corners
                            ),
                          ),
                          Text('High Priority',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              )),
                          SizedBox(width: 4),
                          Image.asset(
                            "assets/images/error.png",
                            height: 16,
                            width: 16,
                          ),
                          SizedBox(width: 10),
                          // Spacer(),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  transform: GradientRotation(-0.003673),
                                  stops: [0.0, 1.0],
                                  colors: [Color.fromRGBO(25, 129, 51, 0.77), Color.fromRGBO(55, 173, 84, 0.88)],
                                ),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.25),
                                    offset: Offset(0.0, 4.0),
                                    spreadRadius: 0.0,
                                    blurRadius: 4.0,
                                  )
                                ],
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  // Handle submit action here
                                },
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                                    backgroundColor: Colors.transparent, // Set background to transparent
                                    shadowColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                                child: Text('Submit', style: TextStyle(color: Colors.white, fontSize: 18)),
                              ),
                            ),
                          ),
                        ],
                      )),

                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build choice options
  Widget _buildChoiceOption(String title, List<String> options, String selectedOption, Function(String) onSelected) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: options.map((option) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ChoiceChip(
                label: Text(option, style: TextStyle(color: selectedOption == option ? Colors.white : Colors.black87)),
                selected: selectedOption == option,
                backgroundColor: Colors.white,
                selectedColor: Color.fromRGBO(55, 173, 84, 1),
                showCheckmark: false,
                onSelected: (selected) {
                  onSelected(option);
                },
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildToggleChoice(String title, List<String> options, Set<String> selectedOptions, Function(String, bool) onToggle) {
    final screenWidth = MediaQuery.of(context).size.width; // Get screen width
    final itemWidth = (screenWidth / 2) - 40; // Divide screen width by 2 and subtract padding for better spacing

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: Colors.white, fontSize: 18)),
        SizedBox(height: 10),
        Wrap(
          spacing: 5, // Adjust the spacing between switches
          runSpacing: 5, // Adjust the spacing between rows
          alignment: WrapAlignment.start, // Aligns items at the start of each row
          children: options.map((option) {
            return Container(
              width: itemWidth, // Set width to fit 2 items per row
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.scale(
                    scale: 0.6, // Reduce the size of the switch to 80%
                    child: Switch(
                      value: selectedOptions.contains(option),
                      onChanged: (value) {
                        onToggle(option, value);
                      },
                      activeColor: Colors.green,
                      activeTrackColor: Colors.greenAccent,
                      inactiveTrackColor: Colors.grey.shade50,
                      inactiveThumbColor: Colors.black26,
                    ),
                  ),
                  Flexible(
                    child: Text(option,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        )),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
