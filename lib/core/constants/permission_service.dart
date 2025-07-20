import 'package:permission_handler/permission_handler.dart';

Future<void> requestPermissions() async {
  if (await Permission.storage.isDenied || await Permission.storage.isRestricted) {
    PermissionStatus status = await Permission.storage.request();

    if (status.isGranted) {
      print('✅ Storage permission granted');
    } else if (status.isPermanentlyDenied) {
      print('❌ Permission permanently denied — open settings');
      await openAppSettings(); // opens settings so user can enable manually
    } else {
      print('❌ Storage permission denied');
    }
  } else {
    print('✅ Storage permission already granted');
  }
}
