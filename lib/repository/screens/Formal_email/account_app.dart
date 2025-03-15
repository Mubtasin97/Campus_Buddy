import 'package:campus_buddy/repository/screens/Formal_email/gen_email.dart';
import 'package:flutter/material.dart';

class AccountDeptPage extends StatefulWidget {
  @override
  _AccountDeptPageState createState() => _AccountDeptPageState();
}

class _AccountDeptPageState extends State<AccountDeptPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _courseNameController = TextEditingController();
  //final TextEditingController _sectionController = TextEditingController();
  final TextEditingController _semesterController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();

  String? _selectedType;
  String? _selectedGender;

  // Navigate to GenEmailPage with generated email content
  void _generateEmail() {
    if (_selectedType == null ||
        _nameController.text.isEmpty ||
        _studentIdController.text.isEmpty ||
        _courseNameController.text.isEmpty ||
        //_sectionController.text.isEmpty ||
        _selectedGender == null ||
        _semesterController.text.isEmpty ||
        _amountController.text.isEmpty ||
        _reasonController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    // Navigate to GenEmailPage with form data
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GenEmailPage(
          name: _nameController.text,
          studentId: _studentIdController.text,
          courseName: _courseNameController.text,
          //  section: _sectionController.text,
          gender: _selectedGender!,
          semester: _semesterController.text,
          amount: _amountController.text,
          reason: _reasonController.text,
          emailType: 'accounts', // Specify account department email type
          accountType: _selectedType!, // Pass selected type
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
          'Accounts Dept',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDropdownField(
              'Type',
              'Select a type',
              ['Partial Payment Request', 'Due Clearence Request'],
              (value) => setState(() => _selectedType = value),
              _selectedType,
            ),
            _buildInputField('Name', 'Enter Your Full Name', _nameController),
            _buildInputField(
                'Student ID', 'eg. xx-xxxxx-x', _studentIdController),
            _buildInputField('Program', 'eg. BSc CSE', _courseNameController),
            //_buildInputField(
            //  'Section', 'Enter Your Section', _sectionController),
            _buildDropdownField(
              'Gender',
              'Select Gender',
              ['Male', 'Female'],
              (value) => setState(() => _selectedGender = value),
              _selectedGender,
            ),
            _buildInputField(
                'Current Semester', 'eg. Summer 22-23', _semesterController),
            _buildInputField(
                'Amount', 'Enter the amount you want to pay', _amountController,
                isNumber: true),
            _buildInputField(
                'Reason', 'Please Provide a detailed reason', _reasonController,
                maxLines: 4),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: _generateEmail,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                  child: Text('Generate'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build text input fields
  Widget _buildInputField(
      String label, String hint, TextEditingController controller,
      {int maxLines = 1, bool isNumber = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          TextField(
            controller: controller,
            maxLines: maxLines,
            keyboardType: isNumber ? TextInputType.number : TextInputType.text,
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to build dropdown fields
  Widget _buildDropdownField(String label, String hint, List<String> items,
      Function(String?) onChanged, String? selectedValue) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          DropdownButton<String>(
            isExpanded: true,
            value: selectedValue,
            hint: Text(hint),
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
