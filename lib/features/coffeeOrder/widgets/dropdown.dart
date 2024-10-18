import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class CustomPopupDropdown extends StatefulWidget {
  @override
  _CustomPopupDropdownState createState() => _CustomPopupDropdownState();
}

class _CustomPopupDropdownState extends State<CustomPopupDropdown> {
  String selectedValue = '1'; // Default selected value

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.0), // Padding around the dropdown
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey, // Blue border color (adjust as per your need)
          width: 1.0,         // Border width
        ),
        borderRadius: BorderRadius.circular(6.0), // Rounded corners
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                  selectedValue,
                  style:GoogleFonts.inter(
                    fontSize: 16,
                    color: Color.fromRGBO(155, 155, 155, 1),
                    fontWeight: FontWeight.w700,
                  )
              ),
            ),
            const VerticalDivider(
              width: 1, // Set a thin divider
              color: Colors.grey, // Divider color
              thickness: 1, // Thin divider
            ),
            PopupMenuButton<String>(
              padding: EdgeInsets.zero, // Remove padding from the button

              icon: Icon(Icons.keyboard_arrow_down_outlined, color: Colors.grey), // Three dot menu icon or dropdown arrow
              onSelected: (String value) {
                setState(() {
                  selectedValue = value;
                });
              },
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: '1',
                    child: Text('1'),
                  ),
                  PopupMenuItem<String>(
                    value: '2',
                    child: Text('2'),
                  ),
                  PopupMenuItem<String>(
                    value: '3',
                    child: Text('3'),
                  ),
                  PopupMenuItem<String>(
                    value: '4',
                    child: Text('4'),
                  ),
                  PopupMenuItem<String>(
                    value: '5',
                    child: Text('5'),
                  ),
                ];
              },
            ),
          ],
        ),
      ),
    );
  }
}


