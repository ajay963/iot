import 'package:flutter/material.dart';

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
            Text('Connected to Internet', style: _txtTheme.bodyText1),
            const SizedBox(height: 5),
            Text('Cellular Connection', style: _txtTheme.bodyText1),
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
