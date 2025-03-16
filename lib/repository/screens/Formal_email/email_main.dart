import 'package:campus_buddy/repository/screens/Formal_email/account_app.dart';
import 'package:campus_buddy/repository/screens/Formal_email/bset_app.dart';
import 'package:campus_buddy/repository/screens/Formal_email/drop_app.dart';
import 'package:flutter/material.dart';

class FormalEmailPage extends StatefulWidget {
  @override
  _FormalEmailPageState createState() => _FormalEmailPageState();
}

class _FormalEmailPageState extends State<FormalEmailPage> {
  int? _selectedOption;

  // Navigate to corresponding pages
  void _navigateToNextPage() {
    if (_selectedOption == null) return;

    switch (_selectedOption) {
      case 0:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DropApplicationPage()));
        break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BSetApplicationPage()));
        break;
      case 2:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AccountDeptPage()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20), // Rounded bottom edges
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Formal Email',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 31, 52, 137),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Please choose your email subject',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            SizedBox(height: 30),

            // Radio Buttons
            _buildRadioOption(0, "Drop Application"),
            _buildRadioOption(1, "B-set Application"),
            _buildRadioOption(2, "Account Department"),

            SizedBox(height: 40),

            // Cancel and Proceed Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _navigateToNextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text(
                    'Proceed',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),
            Text(
              "*This feature will create a automated generated email using using the data you will enter.\n "
              "\n"
              "*You can also edit this as your need before sending.\n",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: IconButton(
          icon: Icon(Icons.home, size: 30),
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
      ),
    );
  }

  // Helper to create radio options
  Widget _buildRadioOption(int value, String label) {
    return RadioListTile<int>(
      value: value,
      groupValue: _selectedOption,
      onChanged: (int? val) {
        setState(() {
          _selectedOption = val;
        });
      },
      title: Text(
        label,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
