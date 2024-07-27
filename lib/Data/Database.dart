/*import 'package:hive_flutter/hive_flutter.dart';

class data_base {
  List<Map<String, dynamic>> messages = [];
  Future<void> loadDatabase() async {
    var data = _mybox.get("GETIN");
    messages = data != null ? List<Map<String, dynamic>>.from(data) : [];
  }

  void updateDatabase() {
    _mybox.put("GETIN", messages);
  }
}
*/