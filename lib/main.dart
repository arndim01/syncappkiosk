import 'package:flutter/material.dart';
import 'package:syncappkiosk/pages/cashinservicepage.dart';
import 'package:syncappkiosk/pages/gcashformpage.dart';
import 'package:syncappkiosk/pages/getstartedpage.dart';
import 'package:syncappkiosk/pages/kioskmainpage.dart';
import 'package:syncappkiosk/pages/splashpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Deeploy Kiosk',
        theme: ThemeData(fontFamily: 'Quicksand'),
        initialRoute: '/',
        onGenerateRoute: (settings) {
          if (settings.name == "/started") {
            return PageRouteBuilder(
                settings: const RouteSettings(name: '/started'),
                pageBuilder: (_, __, ___) => const GetStartedPage(),
                transitionDuration: Duration.zero);
          }

          return null;
        },
        routes: {
          '/': (context) => const SplashPage(duration: 2, goToPage: '/started'),
          '/kioskmain': (context) => const KioskMainPage(),
          '/cashinservice': (context) => const CashInServicePage(),
          '/gcashform': (context) => const GCashFormPage()
        });
  }
}
