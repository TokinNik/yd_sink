import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> checkConnection() async {
  var result = await (Connectivity().checkConnectivity());
  return result != ConnectivityResult.none;
}