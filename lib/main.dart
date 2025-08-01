import 'package:campus_buddy/repository/screens/Courses/courses_main.dart';
import 'package:campus_buddy/repository/screens/FacultyPage/faculty_info.dart';
import 'package:campus_buddy/repository/screens/FacultyPage/faculty_main.dart';
import 'package:campus_buddy/repository/screens/FacultyPage/warning_page.dart';
import 'package:campus_buddy/repository/screens/Formal_email/email_main.dart';
import 'package:campus_buddy/repository/screens/MetarialPage/metarial.dart';
import 'package:campus_buddy/repository/screens/ThankPage/thanks.dart';
import 'package:campus_buddy/repository/screens/UploadPage/uploadScreen.dart';
import 'package:campus_buddy/repository/screens/HomeScreen/homeScreen.dart';
import 'package:campus_buddy/repository/screens/contact/contact_main.dart';
import 'package:campus_buddy/repository/screens/login/loginScreen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Campus buddy",
      //home: HomePage(),
      //home: UploadScreen(),
      // home: MaterialsPage(),
      //home: SubmissionSuccessPage(),
      //home: FacultyPage(),
      //home: FacultyDetailsPage(),
      //home: WarningPage(),
      //home: CoursesPage(),
      home: ContactsPage(),
      //home: FormalEmailPage(),
    );
  }
}
