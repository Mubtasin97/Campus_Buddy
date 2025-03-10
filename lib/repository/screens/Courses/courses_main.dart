import 'package:flutter/material.dart';

class CoursesPage extends StatelessWidget {
  final List<Map<String, String>> courses = [
    {
      "code": "CSC1101",
      "name": "Introduction to Computer Studies",
      "pre": "Nill",
      "color": "0xFF008CFF"
    },
    {
      "code": "EEE2103",
      "name": "Electronic Devices",
      "pre": "COE2101",
      "color": "0xFFFFA500"
    },
    {
      "code": "ENG1202",
      "name": "English Writing Skills & Communications",
      "pre": "ENG1101",
      "color": "0xFFFF2D2D"
    },
    {
      "code": "BBA1102",
      "name": "Principles of Accounting",
      "pre": "MAT1205",
      "color": "0xFF008000"
    },
    {
      "code": "CSC2108",
      "name": "Introduction to Database",
      "pre": "CSC1205",
      "color": "0xFF008CFF"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF1A1A5E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20), // Rounded bottom edges
          ),
        ),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Courses",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            // Filter Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _filterButton("All", isSelected: true),
                _filterButton("Completed"),
                _filterButton("Unlocked"),
              ],
            ),
            SizedBox(height: 20),
            // Search Bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search by name",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.search, color: Colors.black54),
                ],
              ),
            ),
            SizedBox(height: 40),
            // Course List
            Expanded(
              child: ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return _courseTile(course["code"]!, course["name"]!,
                      course["pre"]!, Color(int.parse(course["color"]!)));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Filter Buttons
  Widget _filterButton(String text, {bool isSelected = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black87 : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(color: isSelected ? Colors.white : Colors.black),
      ),
    );
  }

  // Course Tile
  Widget _courseTile(String code, String name, String pre, Color color) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(15), // Full curve on the left
              right: Radius.circular(40), // Straight cut on the right
            ),
            child: Container(
              width: 100, // Adjust width for better shape
              height: 65, // Set height to fully touch top & bottom
              color: color, // Course color
              alignment: Alignment.center,
              child: Text(
                code,
                style: TextStyle(
                  fontSize: 19, // Adjust font size
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          // Course Details
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12), // Balance spacing
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Pre: $pre",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
