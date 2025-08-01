import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class GenEmailPage extends StatefulWidget {
  final String name;
  final String studentId;
  final String courseName;
  final String? section;
  final String gender;
  final String? semester;
  final String? amount;
  final String? reason;
  final String emailType;
  final String? accountType;

  GenEmailPage({
    required this.name,
    required this.studentId,
    required this.courseName,
    this.section,
    required this.gender,
    this.semester,
    this.amount,
    this.reason,
    required this.emailType,
    this.accountType,
  });

  @override
  _GenEmailPageState createState() => _GenEmailPageState();
}

class _GenEmailPageState extends State<GenEmailPage> {
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: _generateEmailContent());
  }

  String _generateEmailContent() {
    String reasonText = widget.reason ?? "Not specified";
    String semesterText = widget.semester ?? "Not specified";
    String amountText = widget.amount ?? "Not specified";
    String accountTypeText = widget.accountType ?? "Not specified";

    if (widget.emailType == 'drop_application') {
      return '''
Hello Sir/Madam,
I am currently a student of ${widget.courseName} of your section. Because of $reasonText I don't want to continue this course in this semester. I will retake this course in upcoming semester. So please consider me giving a UW in your course. Thank you.

Sincerely,  
${widget.name}
ID: ${widget.studentId}
Section: ${widget.section}
Course: ${widget.courseName}
      ''';
    } else if (widget.emailType == 'bset') {
      return '''
Dear B-SET Committee,

I hope this email finds you well. My name is ${widget.name}, and I am a student enrolled in the course "${widget.courseName}" in section ${widget.section}. My student ID is ${widget.studentId}.

I am applying for the B-SET program and would like to formally submit my request. 

Gender: ${widget.gender}.

Reason for application:
$reasonText

I kindly request your assistance in processing my application.

Thank you for your time and consideration.

Best regards,  
${widget.name}
      ''';
    } else if (widget.emailType == 'accounts') {
      return '''
Hello Sir,

I am ${widget.name},  currently enrolled in $semesterText. My student ID is ${widget.studentId}. Due to some circumstance I am unable to pay the full amount. I am willing to pay $accountTypeText of TK $amountText. It will be very helpful if you can give me a new receipt of TK $amountText of ${widget.gender}. It is very urgent. I hope you will consider.
Thank you.

Sincerely,  
Name: ${widget.name}
ID: ${widget.studentId}
      ''';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generated Email'),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20), // Rounded bottom edges
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Editable Text Box with Scroll
            Container(
              width: 400,
              height: 500,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black38),
              ),
              child: Scrollbar(
                child: TextField(
                  controller: _emailController,
                  maxLines: null, // Allows unlimited lines
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Clipboard.setData(
                        ClipboardData(text: _emailController.text));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Copied to clipboard!')),
                    );
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
                        'subject': 'Generated Email',
                        'body': _emailController.text,
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
