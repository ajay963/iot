import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:iot/main.dart';
import 'package:iot/themes.dart';

class InternetChecker extends StatefulWidget {
  const InternetChecker({Key? key, fg}) : super(key: key);

  @override
  _InternetCheckerState createState() => _InternetCheckerState();
}

class _InternetCheckerState extends State<InternetChecker> {
  late bool _hasInernet = false;
  late ConnectivityResult _networkType = ConnectivityResult.none;
  late StreamSubscription _internetSubscriptions;
  late StreamSubscription _networkSubscriptions;

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
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //     backgroundColor: (_hasInernet == true) ? Colors.green : Colors.red,
        //     padding: const EdgeInsets.all(10),
        //     content: Text((_hasInernet == true) ? 'Online' : 'Offline',
        //         textAlign: TextAlign.center,
        //         style: Theme.of(context).textTheme.bodyText2)));
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
    // final _networkData = Provider.of<InternetCheckerClass>(context);
    // _networkData.setInternetStatus(_hasInernet);
    // _networkData.setNetworkType(_networkType);
    return (_hasInernet == true)
        ? HomeScreen(
            hasInternet: _hasInernet,
            connectivityResult: _networkType,
          )
        : NoNetScreen();
  }
}

class NoNetScreen extends StatelessWidget {
  final TextTheme _txtTheme = Themeing.appTheme.textTheme;
  NoNetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
          child: Directionality(
        textDirection: TextDirection.ltr,
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: '404\n\n',
              style: TextStyle(
                fontFamily: _txtTheme.headline2!.fontFamily,
                fontSize: 36,
                color: Colors.grey,
              )),
          TextSpan(text: 'No Internet Connection', style: _txtTheme.headline2),
        ])),
      )),
    );
  }
}
