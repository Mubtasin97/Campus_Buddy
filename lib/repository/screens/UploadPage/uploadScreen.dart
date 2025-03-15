import 'package:campus_buddy/repository/screens/ThankPage/thanks.dart';
import 'package:flutter/material.dart';
import 'package:campus_buddy/repository/widgets/UiHelper.dart';

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String? selectedMaterial;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload'),
        centerTitle: true, // Centering the title
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20), // Rounded bottom edges
          ),
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Uihelper.customText(
              "Current Points: 20",
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                labelText: 'Course name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Course faculty',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                'Which type material you want to upload?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Keep buttons centered
              children: [
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.2, // Increase radio button size
                      child: Radio(
                        value: 'Slides',
                        groupValue: selectedMaterial,
                        onChanged: (value) {
                          setState(() {
                            selectedMaterial = value.toString();
                          });
                        },
                      ),
                    ),
                    Text(
                      'Slides',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(width: 30), // Space between radio options
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.2,
                      child: Radio(
                        value: 'Hand-Notes',
                        groupValue: selectedMaterial,
                        onChanged: (value) {
                          setState(() {
                            selectedMaterial = value.toString();
                          });
                        },
                      ),
                    ),
                    Text(
                      'Hand-Notes',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Image.asset(
                    'assets/icons/upload_btn.png',
                    width: 150,
                    height: 150,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SubmissionSuccessPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12), // Bigger button size
                    textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold), // Bigger text size
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Rounded button edges
                    ),
                  ),
                  child: Text('Submit'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
