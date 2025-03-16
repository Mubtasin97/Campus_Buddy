import 'package:campus_buddy/repository/screens/Formal_email/email_main.dart';
import 'package:flutter/material.dart';
import 'registrar_page.dart';
import 'accounts_page.dart';
import 'osa_page.dart';
import 'sports_page.dart';

class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Contacts',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 40),

            // Contact Buttons (with Navigation)
            _contactButton(context, 'Registrar’s Office', RegistrarPage()),
            _contactButton(context, 'Accounts department', AccountsPage()),
            _contactButton(
                context, 'Office of Student Affairs (OSA)', OsaPage()),
            _contactButton(context, 'Office of Sports (OS)', SportsPage()),

            SizedBox(height: 100),

            // Email Generator
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FormalEmailPage()),
                );
              },
              child: Column(
                children: [
                  Image.asset(
                    'assets/icons/email_gen.png',
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Generate formal e-mails',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // Contact Button Widget with Navigation
  Widget _contactButton(BuildContext context, String label, Widget page) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
        child: Text(
          label,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
    );
  }
}
