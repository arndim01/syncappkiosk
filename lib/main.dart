import 'package:flutter/material.dart';
import 'package:syncappkiosk/pages/cashinservice.page.dart';
import 'package:syncappkiosk/pages/creditform.page.dart';
import 'package:syncappkiosk/pages/gcashform.page.dart';
import 'package:syncappkiosk/pages/getstarted.page.dart';
import 'package:syncappkiosk/pages/kioskmain.page.dart';
import 'package:syncappkiosk/pages/splash.page.dart';
import 'package:syncappkiosk/widgets/creditform.widget.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CreditFormPage(),
  ));
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
