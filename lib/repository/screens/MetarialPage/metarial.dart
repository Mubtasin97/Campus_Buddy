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
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      HomePage()), // Ensure HomeScreen is imported
            );
          },
        ),
        title: Text('Materials',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text('Currently Registered Courses',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.8,
                ),
                itemCount: courseColors.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: courseColors[index],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Become a supporter',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('By uploading your course materials or handnotes',
                style: TextStyle(color: Colors.black54)),
            SizedBox(height: 10),
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.blue,
              child: Icon(Icons.add, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
