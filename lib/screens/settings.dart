import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot/provider/network.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _txtTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text(
              'Connectivity',
              style: _txtTheme.headline2,
            ),
            const SizedBox(height: 10),
            const NetworkWidget(),
            const SizedBox(height: 10),
            const Divider(thickness: 2),
            const SizedBox(height: 10),
            Text('App Info', style: _txtTheme.headline2),
            const SizedBox(height: 10),
            Text('App Version', style: _txtTheme.bodyText1),
            const SizedBox(height: 5),
            Text('Flutter Version', style: _txtTheme.bodyText1),
          ],
        ),
      ),
    );
  }
}

class NetworkWidget extends StatelessWidget {
  const NetworkWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _netChecker = Provider.of<InternetCheckerClass>(context);
    final _networkSet = NetworkData();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (_netChecker.getInternetStatua == true)
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
        Text(_networkSet.networkData(networkResult: _netChecker.getNetworkType),
            style: Theme.of(context).textTheme.bodyText1)
      ],
    );
  }
}
