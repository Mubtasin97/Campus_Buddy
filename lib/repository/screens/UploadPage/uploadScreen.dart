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
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Uihelper.customText(
              "Current point : 20",
              fontSize: 16,
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Course name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Course faculty',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Which type material you want to upload?',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Radio(
                      value: 'Slides',
                      groupValue: selectedMaterial,
                      onChanged: (value) {
                        setState(() {
                          selectedMaterial = value.toString();
                        });
                      },
                    ),
                    Text('Slides')
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 'Hand-Notes',
                      groupValue: selectedMaterial,
                      onChanged: (value) {
                        setState(() {
                          selectedMaterial = value.toString();
                        });
                      },
                    ),
                    Text('Hand-Notes')
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            InkWell(
              onTap: () {},
              child: Column(
                children: [
                  // Uihelper.customIcon( // Custom icon for upload
                  //   icon: Icons.cloud_upload, // You can use any icon
                  //   size: 50,
                  //   color: Colors.blue,
                  // ),
                  Image.asset(
                    'assets/icons/upload_btn.png', // Your custom icon
                    width: 100,
                    height: 100,
                  ),
                  //Icon(Icons.add_box, size: 50),
                ],
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                  ),
                  child: Text('Submit'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
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
