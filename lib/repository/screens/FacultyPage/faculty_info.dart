import 'package:campus_buddy/repository/screens/FacultyPage/warning_page.dart';
import 'package:campus_buddy/repository/screens/HomeScreen/homeScreen.dart';
import 'package:flutter/material.dart';

class FacultyDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/image/faculty_image.png'),
            ),
            SizedBox(height: 20),
            Text(
              "Tamim Hossain",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text(
              "FACULTY OF ENGINEERING",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
            ),
            SizedBox(height: 10),
            Text(
              "DS0301C",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.email, color: Colors.blue),
                SizedBox(width: 5),
                Text("tamim@aiub.edu",
                    style: TextStyle(fontSize: 20, color: Colors.black)),
              ],
            ),
            SizedBox(height: 14),
            InkWell(
              onTap: () {
                // Add link function here
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.language, color: Colors.black),
                  SizedBox(width: 5),
                  Text(
                    "View in website",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
            SizedBox(height: 19),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WarningPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              ),
              child: Text(
                "Tips",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "*To see unofficial review about him/her click the button\n*Please read the disclaimer before proceeding",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13, color: const Color.fromARGB(255, 22, 21, 21)),
            ),
            SizedBox(height: 50),
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              icon: Icon(Icons.home, size: 60),
            ),
            //SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
