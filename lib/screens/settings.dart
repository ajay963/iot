import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _txtTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(height: 40),
          Text(
            'Connectivity',
            style: _txtTheme.headline2,
          ),
          const SizedBox(height: 20),
          Text('Connected to Internet', style: _txtTheme.bodyText1),
          Text('Cellular Connection', style: _txtTheme.bodyText1),
          const Divider(thickness: 2),
          const SizedBox(height: 20),
          Text('App Info', style: _txtTheme.headline2),
          const SizedBox(height: 10),
          Text('App Version', style: _txtTheme.bodyText1),
          Text('Flutter Version', style: _txtTheme.bodyText1),
        ],
      ),
    );
  }
}
