import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkModeEnabled = false;

  void logOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor =
        isDarkModeEnabled ? Colors.black : Color.fromARGB(255, 238, 238, 238);
    Color textColor = isDarkModeEnabled ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text('Settings', style: TextStyle(color: textColor)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'General Settings',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.language, color: textColor),
              title: Text('Language', style: TextStyle(color: textColor)),
              onTap: () {
                // Implement language settings functionality
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications, color: textColor),
              title: Text('Notifications', style: TextStyle(color: textColor)),
              onTap: () {
                // Implement notification settings functionality
              },
            ),
            ListTile(
              leading: Icon(Icons.dark_mode, color: textColor),
              title: Text('Dark Mode', style: TextStyle(color: textColor)),
              onTap: () {
                setState(() {
                  isDarkModeEnabled = !isDarkModeEnabled;
                });
              },
            ),
            Divider(color: textColor),
            Text(
              'Account Settings',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.person, color: textColor),
              title: Text('Edit Profile', style: TextStyle(color: textColor)),
              onTap: () {
                // Implement edit profile functionality
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: textColor),
              title: Text('Logout', style: TextStyle(color: textColor)),
              onTap: () {
                logOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
