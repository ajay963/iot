import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:iot/provider/network.dart';

class InternetChecker extends StatefulWidget {
  const InternetChecker({Key? key}) : super(key: key);

  @override
  _InternetCheckerState createState() => _InternetCheckerState();
}

class _InternetCheckerState extends State<InternetChecker> {
  bool _hasInernet = false;
  ConnectivityResult _networkType = ConnectivityResult.none;
  late StreamSubscription _internetSubscriptions;
  late StreamSubscription _networkSubscriptions;

  final _networkData = NetworkData();

  @override
  void initState() {
    super.initState();

    //network type connection
    _networkSubscriptions =
        Connectivity().onConnectivityChanged.listen((event) {
      setState(() {
        _networkType = event;
      });
    });

    //checking for internet
    _internetSubscriptions =
        InternetConnectionChecker().onStatusChange.listen((event) {
      setState(() {
        _hasInernet = (event == InternetConnectionStatus.connected);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _internetSubscriptions.cancel();
    _networkSubscriptions.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (_hasInernet == true)
            ? Text(
                'Connected to Internet',
                style: TextStyle(
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    fontSize: 18,
                    color: Colors.green),
              )
            : Text(
                'No Internet',
                style: TextStyle(
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    fontSize: 18,
                    color: Colors.red),
              ),
        const SizedBox(height: 5),
        Text(_networkData.networkData(networkResult: _networkType),
            style: Theme.of(context).textTheme.bodyText1)
      ],
    );
  }
}
