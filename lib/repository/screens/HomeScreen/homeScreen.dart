import 'package:campus_buddy/repository/screens/Courses/courses_main.dart';
import 'package:campus_buddy/repository/screens/FacultyPage/faculty_main.dart';
import 'package:campus_buddy/repository/screens/contact/contact_main.dart';
import 'package:flutter/material.dart';
import 'package:campus_buddy/repository/widgets/UiHelper.dart';
import 'package:campus_buddy/repository/screens/MetarialPage/metarial.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[270],
      // Left Sidebar for Menu
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Profile page
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Settings page
              },
            ),
          ],
        ),
      ),
      // Right Sidebar for Notifications
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Notifications',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: Text('Notification 1'),
              onTap: () {
                Navigator.pop(context);
                // Handle Notification 1 action
              },
            ),
            ListTile(
              title: Text('Notification 2'),
              onTap: () {
                Navigator.pop(context);
                // Handle Notification 2 action
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: BottomAppBar(
          color: Colors.white,
          shape: CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Home Icon
              IconButton(
                icon: Icon(Icons.home, size: 30, color: Colors.blue),
                onPressed: () {
                  print("Home icon pressed");
                  // Optionally navigate to HomePage if needed
                },
              ),
              // Search Icon
              IconButton(
                icon: Icon(Icons.search, size: 30, color: Colors.blue),
                onPressed: () {
                  print("Search icon pressed");
                  // Add navigation logic for search
                },
              ),
              // Notifications Icon (opens right sidebar)
              IconButton(
                icon: Icon(Icons.notifications, size: 30, color: Colors.blue),
                onPressed: () {
                  _scaffoldKey.currentState?.openEndDrawer();
                },
              ),
              // Settings Icon
              IconButton(
                icon: Icon(Icons.settings, size: 30, color: Colors.blue),
                onPressed: () {
                  print("Settings icon pressed");
                  // Add navigation logic for settings
                },
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
                      // Sidebar (Menu) icon – opens left drawer
                      IconButton(
                        icon: Icon(Icons.menu, color: Colors.white),
                        onPressed: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                      ),
                      // Notification icon – opens right drawer
                      IconButton(
                        icon: Icon(Icons.notifications, color: Colors.white),
                        onPressed: () {
                          _scaffoldKey.currentState?.openEndDrawer();
                        },
                      ),
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
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 16)),
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
                            builder: (context) => MaterialsPage()),
                      );
                    },
                  ),
                  _buildFeatureItem(
                    "assets/icons/faculty_icon.png",
                    "Faculty",
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FacultyPage()),
                      );
                    },
                  ),
                  _buildFeatureItem(
                    "assets/icons/finance_icon.png",
                    "Finance",
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FinancePage()),
                      );
                    },
                  ),
                  _buildFeatureItem(
                    "assets/icons/stat_icon.png",
                    "Statistics",
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StatisticsPage()),
                      );
                    },
                  ),
                  _buildFeatureItem(
                    "assets/icons/completed_icon.png",
                    "Courses",
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CoursesPage()),
                      );
                    },
                  ),
                  _buildFeatureItem(
                    "assets/icons/sos_icon.png",
                    "SOS",
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SOSPage()),
                      );
                    },
                  ),
                  _buildFeatureItem(
                    "assets/icons/routine_icon.png",
                    "Demo Routine",
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DemoRoutinePage()),
                      );
                    },
                  ),
                  _buildFeatureItem(
                    "assets/icons/contact_icon.png",
                    "Contacts",
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContactsPage()),
                      );
                    },
                  ),
                  _buildFeatureItem(
                    "assets/icons/feedback.png",
                    "Feedback",
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FeedbackPage()),
                      );
                    },
                  ),
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
            width: 50,
            height: 50,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  blurRadius: 400,
                  color: Colors.black.withOpacity(0.5),
                  offset: Offset(0, 5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Placeholder Pages for Navigation

class FinancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Finance")),
      body: Center(child: Text("Finance Page")),
    );
  }
}

class StatisticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Statistics")),
      body: Center(child: Text("Statistics Page")),
    );
  }
}

class SOSPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SOS")),
      body: Center(child: Text("SOS Page")),
    );
  }
}

class DemoRoutinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo Routine")),
      body: Center(child: Text("Demo Routine Page")),
    );
  }
}

class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Feedback")),
      body: Center(child: Text("Feedback Page")),
    );
  }
}
