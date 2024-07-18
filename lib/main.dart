// ignore_for_file: unused_local_variable, unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:get_in/pages/Save.dart';
import 'package:get_in/pages/auth_page.dart';
import 'package:get_in/pages/filters.dart';
import 'package:get_in/pages/map.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get_in/pages/chatbot.dart';
import 'package:get_in/pages/places.dart';
import 'package:get_in/pages/profile.dart';
import 'package:get_in/pages/settings.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (_) => AppState(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}

// MyBottomNavigationBar widget
class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const Chatbot(),
    const MapPage(lat: '', long: ''),
    const PlacesPage(),
    FiltersPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _handleLocationPermissionDenied() {
    final snackBar = SnackBar(
      content: Text('Location permissions are required to use this app.'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _openChatbotPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyBottomNavigationBar(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Get In',
          ),
        ),
        backgroundColor: Color.fromARGB(255, 0, 173, 181),
        leading: IconButton(
          icon: const Icon(
            Icons.person,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(
                  onLocationPermissionDenied: _handleLocationPermissionDenied,
                  openChatbotPage: _openChatbotPage,
                ),
              ),
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            label: 'Places',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_list_alt),
            label: 'Filters',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 0, 169, 68),
        unselectedItemColor: Color.fromARGB(255, 12, 123, 202),
        backgroundColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}
