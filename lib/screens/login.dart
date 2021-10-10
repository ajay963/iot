import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iot/colors.dart';
import 'package:rive/rive.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _txtThme = Theme.of(context).textTheme;
    return Material(
      color: kspaceBlack,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10),
                child: const RiveAnimation.asset(
                  'assets/tree.riv',
                  fit: BoxFit.cover,
                  animations: ['glow'],
                ),
              ),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(10),
                child: Ink(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 5),
                      child: Text('Sign IN',
                          textAlign: TextAlign.center,
                          style: _txtThme.headline2),
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(10),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
