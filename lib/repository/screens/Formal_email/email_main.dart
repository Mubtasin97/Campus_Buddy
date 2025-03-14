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
        backgroundColor: Colors.pinkAccent,
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
                color: Colors.red[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Please choose your email subject',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 30),

            // Radio Buttons
            _buildRadioOption(0, "Drop Application"),
            _buildRadioOption(1, "B-set Application"),
            _buildRadioOption(2, "Account Dept"),

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
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: _navigateToNextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text('Proceed'),
                ),
              ],
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
      title: Text(label),
    );
  }
}

// Dummy Pages for Navigation

class BSetApplicationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('B-set Application')));
  }
}

class AccountDeptPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Account Dept')));
  }
}
