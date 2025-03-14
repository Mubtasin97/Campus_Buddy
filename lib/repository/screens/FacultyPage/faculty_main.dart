import 'package:campus_buddy/repository/screens/FacultyPage/faculty_info.dart';
import 'package:flutter/material.dart';

class FacultyPage extends StatelessWidget {
  final List<Map<String, dynamic>> faculties = [
    {"code": "CG- D", "name": "Naboranjan Dey", "color": Colors.blue},
    {"code": "TOC- A", "name": "Tonni Shekha Kar", "color": Colors.purple},
    {"code": "DLC- C", "name": "Tamim Hossain", "color": Colors.pinkAccent},
    {"code": "OOP- 2", "name": "Naboranjan Dey", "color": Colors.teal},
    {"code": "WT- M", "name": "Nazmus Sakib Shan", "color": Colors.green},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
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
          "Faculty",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              "Current Course Faculties",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: faculties.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FacultyDetailsPage()),
                        );
                      },
                      child: FacultyCard(
                        courseCode: faculties[index]["code"],
                        facultyName: faculties[index]["name"],
                        color: faculties[index]["color"],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: ElevatedButton(
                onPressed: () {
                  // Add navigation or function
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                ),
                child: Text(
                  "Show all Faculties",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FacultyCard extends StatelessWidget {
  final String courseCode;
  final String facultyName;
  final Color color;

  FacultyCard(
      {required this.courseCode,
      required this.facultyName,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            courseCode,
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            facultyName,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
