import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iot/main.dart';
import 'package:iot/resposive.dart';
import 'package:rive/rive.dart' as rive;

class LogInNarrow extends StatelessWidget {
  final bool hasInternet;
  final ConnectivityResult networkType;
  const LogInNarrow(
      {Key? key, required this.hasInternet, required this.networkType})
      : super(key: key);

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 20),
              SizedBox(
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: rive.RiveAnimation.asset(
                    'assets/tree.riv',
                    fit: BoxFit.cover,
                    animations: ['glow'],
                  ),
                ),
              ),
              const SizedBox(height: 80),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeScreen(
                              hasInternet: hasInternet,
                              connectivityResult: networkType,
                            ))),
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

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final _txtTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        SizedBox(
          width: ResposiveSize().rowSize(screenSize: _screenSize, isBig: true),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: rive.RiveAnimation.asset(
              'assets/tree.riv',
              fit: BoxFit.fitHeight,
              animations: ['glow'],
            ),
          ),
        ),
        Container(
          width: ResposiveSize().rowSize(screenSize: _screenSize, isBig: false),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Welcomne', style: _txtTheme.headline1),
              Text('', style: _txtTheme.headline2),
              const SizedBox(height: 60),
            ],
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff333333), Color(0xff1b1b1b)],
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft),
          ),
        )
      ],
    );
  }
}
