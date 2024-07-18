import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapPage extends StatelessWidget {
  final String lat;
  final String long;

  const MapPage({Key? key, required this.lat, required this.long})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 185, 217, 222),
      body: WebView(
        initialUrl:
            'https://www.google.com/maps/search/?api=1&query=$lat,$long',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
