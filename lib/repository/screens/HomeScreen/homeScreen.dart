import 'package:flutter/material.dart';
import 'package:campus_buddy/repository/widgets/UiHelper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:campus_buddy/repository/screens/MetarialPage/metarial.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[270],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25), // Adjust for more/less rounding
          topRight: Radius.circular(25),
        ),
        child: BottomAppBar(
          color: Colors.white,
          shape: CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home, size: 30, color: Colors.blue),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.search, size: 30, color: Colors.blue),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.notifications, size: 30, color: Colors.blue),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.settings, size: 30, color: Colors.blue),
                onPressed: () {},
              ),
            ],
          ),
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
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.menu, color: Colors.white),
                      Icon(Icons.notifications, color: Colors.white),
                    ],
                  ),
                  SizedBox(height: 10),
                  CircleAvatar(
                    radius: 60,
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
            SizedBox(height: 12),

            // Class Notification Card
            Card(
              margin: EdgeInsets.symmetric(horizontal: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text("12:38 PM",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          height: 80,
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
            SizedBox(height: 0),
            // Feature Icons Grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 27, vertical: 0),
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 18,
                mainAxisSpacing: 0,
                children: [
                  _buildFeatureItem(
                    "assets/icons/material_icon.png",
                    "Materials",
                    () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MaterialsPage()));
                    },
                  ),
                  _buildFeatureItem(
                      "assets/icons/faculty_icon.png", "Faculty", () {}),
                  _buildFeatureItem(
                      "assets/icons/finance_icon.png", "Finance", () {}),
                  _buildFeatureItem(
                      "assets/icons/stat_icon.png", "Statistics", () {}),
                  _buildFeatureItem(
                      "assets/icons/completed_icon.png", "Completed", () {}),
                  _buildFeatureItem(
                      "assets/icons/unlock_icon.png", "Unlocked", () {}),
                  _buildFeatureItem(
                      "assets/icons/routine_icon.png", "Demo Routine", () {}),
                  _buildFeatureItem(
                      "assets/icons/contact_icon.png", "Contacts", () {}),
                  _buildFeatureItem(
                      "assets/icons/feedback.png", "Feedback", () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String assetPath, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            assetPath,
            width: 40,
            height: 40,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  blurRadius: 40, // Softness of the shadow
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.5), // Shadow color
                  offset: Offset(0, 5), // Shadow position (below the text)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
