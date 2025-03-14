import 'package:campus_buddy/repository/screens/Formal_email/gen_email.dart';
import 'package:flutter/material.dart';


class BSetApplicationPage extends StatefulWidget {
  @override
  _BSetApplicationPageState createState() => _BSetApplicationPageState();
}

class _BSetApplicationPageState extends State<BSetApplicationPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _courseNameController = TextEditingController();
  final TextEditingController _sectionController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();

  String? _selectedGender;

  // Navigate to GenEmailPage with generated email content
  void _proceed() {
    if (_nameController.text.isEmpty ||
        _studentIdController.text.isEmpty ||
        _courseNameController.text.isEmpty ||
        _sectionController.text.isEmpty ||
        _reasonController.text.isEmpty ||
        _selectedGender == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields')),
      );
      return; // Stop if any field is empty
    }

    // Navigate to GenEmailPage with form data for B-SET application
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GenEmailPage(
          name: _nameController.text,
          studentId: _studentIdController.text,
          courseName: _courseNameController.text,
          section: _sectionController.text,
          gender: _selectedGender!,
          reason: _reasonController.text, // Reason is added
          emailType: 'bset', // Distinguish the type of email
        ),
      ),
    );
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
          'B-SET Application',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInputField('Name', 'Enter Your Full Name', _nameController),
              _buildInputField('Student ID', 'eg. xx-xxxxx-x', _studentIdController),
              _buildInputField('Course Name', 'Enter Your Full Course Name', _courseNameController),
              _buildInputField('Section', 'Enter Your Section', _sectionController),
              SizedBox(height: 20),
              Text(
                'Gender',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              DropdownButton<String>(
                isExpanded: true,
                value: _selectedGender,
                hint: Text('Select Gender'),
                items: ['Male', 'Female'].map((String gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
              SizedBox(height: 20),
              _buildInputField(
                'Reason',
                'Please Provide a detailed reason',
                _reasonController,
                maxLines: 4,
              ),
              SizedBox(height: 40),
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
                    onPressed: _proceed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                    ),
                    child: Text('Proceed'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build input fields
  Widget _buildInputField(String label, String hint, TextEditingController controller, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
