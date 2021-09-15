import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkData {
  String networkData({required ConnectivityResult networkResult}) {
    switch (networkResult) {
      case ConnectivityResult.mobile:
        return 'Mobile Connection';

      case ConnectivityResult.wifi:
        return 'Wi-Fi Connection';

      case ConnectivityResult.ethernet:
        return 'Ethernet Connection';

      default:
        return 'No Connection';
    }
  }
}
