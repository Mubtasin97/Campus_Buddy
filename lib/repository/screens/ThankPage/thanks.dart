import 'package:campus_buddy/repository/screens/UploadPage/uploadScreen.dart';
import 'package:flutter/material.dart';

class SubmissionSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Removes shadow
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 35,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "Submitted Successfully",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    'assets/icons/success.png', // Ensure this image exists
                    width: 360,
                    height: 360,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Thanks for your support",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 25),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Your current point: 25",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text("Want to upload more files?",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10),
                  FloatingActionButton(
                    onPressed: () {
                      // Handle upload action
                    },
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.add, color: Colors.white, size: 30),
                  ),
                ],
              ),
              Column(
                children: [
                  Text("Go back to the homepage",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18)),
                  //SizedBox(height: 10),
                  IconButton(
                    onPressed: () {
                      // Navigate to homepage
                    },
                    icon: Icon(Icons.home, size: 50, color: Colors.black),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
