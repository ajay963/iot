import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iot/screens/login.dart';
import 'package:provider/provider.dart';
import 'package:iot/provider/colors_list.dart';
import 'package:iot/provider/gradients.dart';
import 'package:iot/provider/light_data.dart';
import 'package:iot/provider/network.dart';
import 'package:iot/provider/advance_page.dart';
import 'package:iot/screens/basic_screen.dart';
import 'package:iot/screens/settings.dart';
import 'package:iot/themes.dart';
import 'package:iot/widgets/network_widget.dart';

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
      child: MaterialApp(
          theme: Themeing.appTheme,
          darkTheme: Themeing.appDarkTheme,
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          home: const LogInScreen()),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final bool hasInternet;
  final ConnectivityResult connectivityResult;
  const HomeScreen({
    Key? key,
    required this.hasInternet,
    required this.connectivityResult,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
            // const SizedBox(width: 20),
            Text(
              'IOT',
              style: Theme.of(context).textTheme.headline1,
            )
          ])),
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: TabBarView(physics: const BouncingScrollPhysics(), children: [
            const BasicsPage(),
            const AdvancePage(),
            SettingPage(
              hasInternet: hasInternet,
              connectivityResult: connectivityResult,
            )
          ]),
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