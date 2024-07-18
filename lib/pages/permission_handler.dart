import 'package:permission_handler/permission_handler.dart';

Future<bool> requestLocationPermission() async {
  var status = await Permission.location.request();
  if (status.isGranted) {
    // Permission granted, proceed to fetch location
    return true;
  } else if (status.isDenied) {
    // Permission denied, show a message to the user
    // and ask them to enable the permission manually
    // You can display a snackbar or dialog to inform the user
    // and guide them to enable the permission manually
    // Example:
    // showSnackBar('Location permission denied. Please enable it in settings.');
    return false;
  } else if (status.isPermanentlyDenied) {
    // Permission permanently denied, navigate the user to
    // the app settings page to enable the permission manually
    // You can open app settings using permission_handler package
    // Example:
    // openAppSettings();
    return false;
  }
  // Handle other cases, such as unknown status
  return false;
}
