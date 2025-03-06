import 'package:flutter/material.dart';
import 'package:campus_buddy/repository/widgets/UiHelper.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                icon: Icon(Icons.home, size: 30, color: Colors.blue),
                onPressed: () {}),
            IconButton(
                icon: Icon(Icons.search, size: 30, color: Colors.blue),
                onPressed: () {}),
            IconButton(
                icon: Icon(Icons.notifications, size: 30, color: Colors.blue),
                onPressed: () {}),
            IconButton(
                icon: Icon(Icons.settings, size: 30, color: Colors.blue),
                onPressed: () {}),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Profile Section
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.menu, color: Colors.white),
                      Icon(Icons.notifications, color: Colors.white),
                    ],
                  ),
                  SizedBox(height: 15),
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.grey[300],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Uihelper.customText("Hi, Username",
                                color: Colors.white70,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            Uihelper.customText("ID: XX-XXXXX-X",
                                color: Colors.white70,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                            // Text("Current Semester: FALL 20XX", textAlign: TextAlign.center, style: TextStyle(color: Colors.white70)),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 1,
                        color: Colors.white70,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Uihelper.customText("Current Semester",
                                color: Colors.white70,
                                fontSize: 18,
                                fontWeight: FontWeight.normal),
                            Uihelper.customText("FALL 24-25",
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            // Text("Hi, Username", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 18)),
                            //Text("ID: XX-XXXXX-X", textAlign: TextAlign.center, style: TextStyle(color: Colors.white70)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  LinearProgressIndicator(
                      value: 0.5, backgroundColor: Colors.white38),
                  SizedBox(height: 5),
                  Text("You have completed XX credits",
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Class Notification Card
            Card(
              margin: EdgeInsets.symmetric(horizontal: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text("12:38 PM",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          height: 50,
                          width: 1,
                          color: Colors.grey,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Computer Graphics",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              Text("DNO811",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              Text("Hurry up!! Class is about to start",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.red)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Feature Icons Grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  _buildFeatureItem("assets/icons/materials_icon.svg", "Materials"),
                  _buildFeatureItem("assets/icons/faculty_icon.svg", "Faculty"),
                  _buildFeatureItem("assets/icons/finance_icon.svg", "Finance"),
                  _buildFeatureItem("assets/icons/stat_icon.svg", "Statistics"),
                  _buildFeatureItem("assets/icons/completed_icon.svg", "Completed"),
                  _buildFeatureItem("assets/icons/unlock_icon.svg", "Unlocked"),
                  _buildFeatureItem("assets/icons/routine_icon.svg", "Demo Routine"),
                  _buildFeatureItem("assets/icons/contacts_icon.svg", "Contacts"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String assetPath, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(assetPath, width: 40, height: 40), // Load SVG icon
        SizedBox(height: 8),
        Text(title,
            textAlign: TextAlign.center, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}
