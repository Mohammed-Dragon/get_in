import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_in/pages/Save.dart';
import 'package:get_in/pages/chatbot.dart';
import 'package:get_in/pages/map.dart';
import 'package:get_in/pages/settings.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  final Function onLocationPermissionDenied;
  final Function openChatbotPage;

  ProfilePage(
      {required this.onLocationPermissionDenied,
      required this.openChatbotPage});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late double lat;
  late double long;

  SettingsPage sp = SettingsPage();

  String name = '  Mohammed Ali';
  String phoneNumber = '  123-456-7890';
  String email = '  ';
  String location = '';

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request.');
    }

    return await Geolocator.getCurrentPosition();
  }

  void _liveLocation() {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      setState(() {
        lat = position.latitude;
        long = position.longitude;
        location = '  Latitude: $lat, Longitude: $long';
      });
    });
  }

  @override
  void initState() {
    super.initState();
    email = '  ' + sp.user.email!;
    _loadProfileState();
  }

  _loadProfileState() async {
    final appState = Provider.of<AppState>(context, listen: false);
    setState(() {
      lat = appState.lat;
      long = appState.long;
      location = '  Latitude: $lat , Longitude: $long';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 173, 181),
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20.0),
            Center(
              child: CircleAvatar(
                radius: 75.0,
                backgroundImage: AssetImage('lib/images/profile.jpg'),
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              'Name',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              name,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Phone',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              phoneNumber,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Email',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              email,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Location',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              location,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 40.0),
            Divider(
              thickness: 2.0,
              color: Color.fromARGB(255, 177, 177, 177),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _getCurrentLocation().then((value) {
                      final appState =
                          Provider.of<AppState>(context, listen: false);
                      if (appState.locationPermissionDenied) {
                        widget.onLocationPermissionDenied();
                      } else {
                        setState(() {
                          lat = value.latitude;
                          long = value.longitude;
                          location = 'Latitude: $lat , Longitude: $long';
                        });
                        _liveLocation();
                        appState.updateLocation(lat, long);
                        // Call the openChatbotPage callback function to open both the chatbot page and the bars page
                        widget.openChatbotPage();
                        // Send message from the chatbot
                        Chatbot.sendMessage(context,
                            "Great, you must now go to the Places page to choose the best location for you.");
                      }
                    });
                  },
                  child: Text(
                    'Give Location',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 0, 173, 181),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MapPage(lat: lat.toString(), long: long.toString()),
                      ),
                    );
                  },
                  child: Text(
                    'Open in Map',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 0, 173, 181),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
