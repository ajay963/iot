import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _txtThme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            child: const RiveAnimation.asset(
              'assets/tree.riv',
              fit: BoxFit.cover,
              animations: ['roll'],
            ),
          ),
          TextButton(
              onPressed: () {},
              child: Text('Sign IN', style: _txtThme.headline2))
        ],
      ),
    );
  }
}
