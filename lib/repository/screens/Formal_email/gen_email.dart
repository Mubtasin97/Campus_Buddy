import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class GenEmailPage extends StatelessWidget {
  final String name;
  final String studentId;
  final String courseName;
  final String section;
  final String gender;
  final String? semester;
  final String? amount;
  final String? reason;
  final String emailType;
  final String? accountType; // Used for Accounts Dept requests

  GenEmailPage({
    required this.name,
    required this.studentId,
    required this.courseName,
    required this.section,
    required this.gender,
    this.semester,
    this.amount,
    this.reason,
    required this.emailType,
    this.accountType,
  });

  @override
  Widget build(BuildContext context) {
    // Generate email content based on email type
    String emailSubject = '';
    String emailContent = '';

    if (emailType == 'drop_application') {
      emailSubject = 'Course Drop Application';
      emailContent = '''
Dear Sir/Madam,

I am $name, a student of section $section. I am requesting to drop the course "$courseName". My student ID is $studentId.

Gender: $gender.

Reason for dropping the course:
$reason

I would appreciate your assistance in processing my request.

Thank you.

Sincerely,  
$name
      ''';
    } else if (emailType == 'bset_application') {
      emailSubject = 'B-SET Application Request';
      emailContent = '''
Dear B-SET Committee,

I hope this email finds you well. My name is $name, and I am a student enrolled in the course "$courseName" in section $section. My student ID is $studentId.

I am applying for the B-SET program and would like to formally submit my request. 

Gender: $gender.

Reason for application:
$reason

I kindly request your assistance in processing my application.

Thank you for your time and consideration.

Best regards,  
$name
      ''';
    } else if (emailType == 'accounts') {
      emailSubject = 'Accounts Department Request';
      emailContent = '''
Dear Accounts Department,

I am $name, a student of section $section, currently enrolled in $semester. My student ID is $studentId.

Request Type: $accountType  
Amount: $amount  

Reason for Request:  
$reason

I kindly request your assistance in processing my request.

Thank you.

Sincerely,  
$name
      ''';
    }

    return Scaffold(
      appBar: AppBar(
          title: Text('Generated Email'), backgroundColor: Colors.pinkAccent),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10)),
                child: SingleChildScrollView(
                    child: Text(emailContent, style: TextStyle(fontSize: 16))),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: emailContent));
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Copied to clipboard!')));
                  },
                  icon: Icon(Icons.copy),
                  label: Text('Copy'),
                ),
                SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: () async {
                    final Uri emailUri = Uri(
                      scheme: 'mailto',
                      queryParameters: {
                        'subject': emailSubject,
                        'body': emailContent
                      },
                    );
                    if (await canLaunch(emailUri.toString())) {
                      await launch(emailUri.toString());
                    }
                  },
                  icon: Icon(Icons.mail),
                  label: Text('Mail'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
