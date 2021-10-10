import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _txtThme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        // color: kspaceBlack,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.20),
              Container(
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(0),
                child: const RiveAnimation.asset(
                  'assets/tree.riv',
                  fit: BoxFit.cover,
                  animations: ['glow'],
                ),
              ),
              const SizedBox(height: 80),
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
