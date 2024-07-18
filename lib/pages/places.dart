import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PlacesPage extends StatelessWidget {
  const PlacesPage({Key? key}) : super(key: key);

  Future<void> launchMap() async {
    final String query = Uri.encodeFull("Pharos Alexandria Club");
    final String googleMapsUrl =
        "https://www.google.com/maps/search/?api=1&query=$query";

    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 185, 217, 222),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Row for three-dot button, select button, and arrow buttons
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(20.0), // Rounded corners
                  ),
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Three-dot button
                      PopupMenuButton<String>(
                        color: Color.fromARGB(255, 255, 255, 255),
                        icon: Icon(Icons.more_vert),
                        onSelected: (String value) async {
                          switch (value) {
                            case 'rate':
                              // Navigate to the evaluation screen
                              break;
                            case 'map':
                              await launchMap();
                              break;
                            case 'share':
                              // Share the place
                              break;
                          }
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          const PopupMenuItem<String>(
                            value: 'rate',
                            child: Text('Rate'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'map',
                            child: Text('Show on Map'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'share',
                            child: Text('Share'),
                          ),
                        ],
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to chatbot and send message about chosen place
                        },
                        child: Text(
                          'Select',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ), // Text color
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 7, 76, 89),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          // Navigate to previous place
                        },
                        icon: Icon(Icons.arrow_back,
                            color: const Color.fromARGB(255, 6, 76, 80)),
                      ),
                      IconButton(
                        onPressed: () {
                          // Navigate to next place
                        },
                        icon: Icon(Icons.arrow_forward,
                            color: const Color.fromARGB(255, 6, 76, 80)),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Text(
                    'Pharos Club Alexandria',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 4, 67, 70),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                // Picture of the place
                Container(
                  height: 300, // Adjust the height as needed
                  width: double
                      .infinity, // Adjust the width to match the screen width
                  color: Color.fromARGB(
                      255, 185, 217, 222), // Example background color
                  padding: EdgeInsets.all(
                      10), // Adjust padding to create space between image and frame
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black, // Adjust border color
                        width: 2, // Adjust border width
                      ),
                    ),
                    child: Image.asset(
                      'lib/images/A.jpg', // Replace 'your_image.jpg' with your image asset path
                      fit: BoxFit
                          .cover, // Adjust the fit according to your requirement
                    ),
                  ),
                ),

                // Text below the picture
              ],
            ),
            // Information about the place
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // First row
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(20.0), // Rounded corners
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 161, 169),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    'Distance',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Center(
                                  child: Text(
                                    '285 Meter',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 161, 169),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    'Weather',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Center(
                                  child: Text(
                                    'Sunny',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 0, 161, 169),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  'Rating',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Center(
                                child: Text(
                                  '4.6 Stars',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 0, 161, 169),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  'Opening/Closing',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Center(
                                child: Text(
                                  '9:00AM - 6:00PM',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Third row
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(
                          255, 21, 141, 115), // Color of the rectangle
                      borderRadius:
                          BorderRadius.circular(20.0), // Rounded corners
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ' Features: It has a gym and swimming training, and the place is characterized by experienced trainers', // Example text
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            // Navigate to place page
                          },
                          child: Text(
                            'Place Page',
                            style: TextStyle(
                              color: Color.fromARGB(
                                  255, 15, 30, 197), // Text color
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Buttons at the bottom
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
