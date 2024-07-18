import 'package:flutter/material.dart';
import 'package:get_in/pages/Save.dart';
import 'package:provider/provider.dart';

class FiltersPage extends StatefulWidget {
  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  late AppState appState; // Initialize the appState variable

  late bool showNearbyOnly;
  late bool showOpenNowOnly;
  late bool showNotCrowdedOnly;
  late String sortBy;

  @override
  void initState() {
    super.initState();
    appState =
        Provider.of<AppState>(context, listen: false); // Initialize appState
    // Initialize state variables with default values or saved values
    showNearbyOnly = appState.selectedFilters.contains('nearby');
    showOpenNowOnly = appState.selectedFilters.contains('open_now');
    showNotCrowdedOnly = appState.selectedFilters.contains('not_crowded');
    sortBy =
        appState.selectedFilters.contains('rating') ? 'Rating' : 'Distance';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 185, 217, 222),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 185, 217, 222),
        title: Text('Advanced search'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sort By:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Rating', style: TextStyle(fontSize: 18.0)),
                Radio<String>(
                  value: 'Rating',
                  groupValue: sortBy,
                  onChanged: (value) {
                    setState(() {
                      sortBy = value!;
                      appState.updateFilters(['rating']);
                    });
                  },
                ),
                SizedBox(width: 45.0),
                Text('Distance', style: TextStyle(fontSize: 18.0)),
                Radio<String>(
                  value: 'Distance',
                  groupValue: sortBy,
                  onChanged: (value) {
                    setState(() {
                      sortBy = value!;
                      appState.updateFilters(['distance']);
                    });
                  },
                ),
                SizedBox(width: 30.0),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              'Filters:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            // Wrap the column containing the checkboxes with an Align widget
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CheckboxListTile(
                    title: Text('Show Nearby Only',
                        style: TextStyle(fontSize: 16.0)),
                    value: showNearbyOnly,
                    onChanged: (newValue) {
                      setState(() {
                        showNearbyOnly = newValue!;
                        if (showNearbyOnly) {
                          appState.updateFilters(
                              [...appState.selectedFilters, 'nearby']);
                        } else {
                          appState.updateFilters([
                            ...appState.selectedFilters
                                .where((filter) => filter != 'nearby')
                          ]);
                        }
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Show Open Now Only',
                        style: TextStyle(fontSize: 16.0)),
                    value: showOpenNowOnly,
                    onChanged: (newValue) {
                      setState(() {
                        showOpenNowOnly = newValue!;
                        if (showOpenNowOnly) {
                          appState.updateFilters(
                              [...appState.selectedFilters, 'open_now']);
                        } else {
                          appState.updateFilters([
                            ...appState.selectedFilters
                                .where((filter) => filter != 'open_now')
                          ]);
                        }
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Show Not Crowded Only',
                        style: TextStyle(fontSize: 16.0)),
                    value: showNotCrowdedOnly,
                    onChanged: (newValue) {
                      setState(() {
                        showNotCrowdedOnly = newValue!;
                        if (showNotCrowdedOnly) {
                          appState.updateFilters(
                              [...appState.selectedFilters, 'not_crowded']);
                        } else {
                          appState.updateFilters([
                            ...appState.selectedFilters
                                .where((filter) => filter != 'not_crowded')
                          ]);
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            // Add the Apply button
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    // Implement apply functionality
                  },
                  child: Text('Apply',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                      )),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 7, 76, 89),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
