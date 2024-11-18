import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  bool _isOnline = false;

  bool get isOnline => _isOnline;

  ConnectivityService() {
    checkConnectivity();
    startListening();
  }

  Stream<List<ConnectivityResult>> get connectivityStream =>
      _connectivity.onConnectivityChanged;

  Future<bool> checkConnectivity() async {
    var connectivityResult = await _connectivity.checkConnectivity();
    var result = await _checkResult(connectivityResult);
    // _isOnline = result;
    return result;
  }

  Future<bool> _checkResult(List<ConnectivityResult> result) async {
    if (result.contains(ConnectivityResult.none)) {
      return false;
    } else {
      // Check if the device has internet access
      try {
        final http.Response response =
            await http.get(Uri.parse('http://google.com'));
        if (response.statusCode == 200) {
          // Internet access
          return true;
        } else {
          // No internet access
          return false;
        }
      } catch (_) {
        // Error making the network request, assume no internet access
        return false;
      }
    }
  }

  void startListening() {
    _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> result) async {
      // _isOnline = result != ConnectivityResult.none;
      _isOnline = await _checkResult(result);
      debugPrint('Network Status Monitoring ==== ${result.first} $isOnline');
    });
  }
}
