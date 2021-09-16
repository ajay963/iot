import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iot/provider/gradients.dart';
import 'package:iot/provider/network.dart';
import 'package:iot/screens/advance_page.dart';
import 'package:iot/screens/basic_screen.dart';
import 'package:iot/screens/settings.dart';
import 'package:iot/themes.dart';
import 'package:iot/widgets/network.dart';
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
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LightData>(create: (context) => LightData()),
        ChangeNotifierProvider<InternetCheckerClass>(
            create: (context) => InternetCheckerClass()),
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
            toolbarHeight: 70,
            title: const Text('IOT'),
            bottom: const TabBar(
              indicatorColor: Colors.transparent,
              labelPadding: EdgeInsets.symmetric(vertical: 14),
              physics: BouncingScrollPhysics(),
              tabs: [
                Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: Text('Basics', textAlign: TextAlign.left),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Text('Advance'),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('Settings'),
                ),
              ],
            ),
          ),
          body: Stack(
            children: [
              const InternetChecker(),
              Ink(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffefefef),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const TabBarView(
                  physics: BouncingScrollPhysics(),
                  children: [BasicsPage(), AdvancePage(), SettingPage()]),
            ],
          ),
        ),
      ),
    );
  }
}



//authentication flow 


//  home: StreamBuilder<User>(
//               stream: FirebaseAuth.instance.authStateChanges(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.active) {
//                   User user = snapshot.data;
//                   if (user != null) {
//                     return Indicator(
//                       authUser: user,
//                     );
//                   }
//                   return LoginPage();
//                 }
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }),