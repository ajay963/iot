import 'package:flutter/material.dart';
import 'package:iot/provider/gradients.dart';
import 'package:iot/screens/basic_screen.dart';
import 'package:iot/themes.dart';
import 'package:provider/provider.dart';
import 'package:iot/provider/colors_list.dart';
import 'package:iot/provider/light_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LightData>(create: (context) => LightData()),
        ChangeNotifierProvider<ColorList>(create: (context) => ColorList()),
        ChangeNotifierProvider<GradientDatalist>(
            create: (context) => GradientDatalist())
      ],
      child: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themeing.appTheme,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: const Color(0xff1b1b1b),
          appBar: AppBar(
            title: const Text('IOT'),
            bottom: const TabBar(
              labelColor: Colors.transparent,
              // controller: TabController(length: length, vsync: vsync),
              physics: BouncingScrollPhysics(),
              tabs: [
                Text('Basics'),
                Text('Advance'),
                Text('Settings'),
              ],
            ),
          ),
          body: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const TabBarView(physics: BouncingScrollPhysics(), children: [
                Basics(),
                Icon(Icons.battery_std_outlined, size: 40, color: Colors.grey),
                Icon(Icons.calculate, size: 40, color: Colors.grey)
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
