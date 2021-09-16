import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:iot/provider/network.dart';
import 'package:provider/provider.dart';

class InternetChecker extends StatefulWidget {
  const InternetChecker({
    Key? key,
  }) : super(key: key);

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
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: (_hasInernet == true) ? Colors.green : Colors.red,
            padding: const EdgeInsets.all(10),
            content: Text((_hasInernet == true) ? 'Online' : 'Offline',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2)));
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
    final _networkData = Provider.of<InternetCheckerClass>(context);
    _networkData.setInternetStatus(_hasInernet);
    _networkData.setNetworkType(_networkType);
    return const SizedBox();
  }
}
