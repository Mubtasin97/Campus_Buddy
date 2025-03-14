import 'package:campus_buddy/repository/screens/UploadPage/uploadScreen.dart';
import 'package:flutter/material.dart';
import 'package:campus_buddy/repository/screens/HomeScreen/homeScreen.dart';

class MaterialsPage extends StatelessWidget {
  final List<Color> courseColors = [
    Colors.blue,
    Colors.purple,
    Colors.red,
    Colors.teal,
    Colors.green,
    Colors.brown,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
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
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        title: Text(
          'Materials',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true, // Centering the title
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Currently Registered Courses',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 50),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 50,
                  childAspectRatio: 1.6,
                ),
                itemCount: courseColors.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: courseColors[index],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      // Ensures text is centered inside each box
                      child: Text(
                        'Course ${index + 1}', // Example text, replace with actual course names
                        style: TextStyle(
                          color: Colors.white, // White text for contrast
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Become a supporter',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'By uploading your course materials or handnotes',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UploadScreen()),
                  );
                },
                backgroundColor: Colors.blue,
                child: Icon(Icons.add,
                    color: Colors.white,
                    size: 30), // Adjust icon size if needed
                elevation: 6, // Adds a slight shadow for better visibility
              ),
            )
          ],
        ),
      ),
    );
  }
}
