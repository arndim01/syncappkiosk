import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:syncappkiosk/helpers/dp_colors.dart';
import 'package:syncappkiosk/pages/cashinservice.page.dart';
import 'package:syncappkiosk/pages/creditform.page.dart';
import 'package:syncappkiosk/pages/gcashform.page.dart';
import 'package:syncappkiosk/pages/getstarted.page.dart';
import 'package:syncappkiosk/pages/kioskmain.page.dart';
import 'package:syncappkiosk/pages/receipt.page.dart';
import 'package:syncappkiosk/pages/splash.page.dart';
import 'package:syncappkiosk/services/transaction.service.dart';

void main() {
  runApp(MultiProvider(providers: [
    Provider(create: (_) => TransactionService()),
  ], child: const MyApp()));
  // runApp(MaterialApp(
  //   debugShowCheckedModeBanner: false,
  //   home: ReceiptPage(),
  // ));
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
          '/': (context) => const SplashPage(duration: 30, goToPage: '/started'),
          '/kioskmain': (context) => const KioskMainPage(),
          '/cashinservice': (context) => const CashInServicePage(),
          '/gcashform': (context) => const LoaderOverlay(
            useDefaultLoading: false,
            overlayWidget: Center(
              child: SpinKitCubeGrid(
                color: DpColors.mainBlue,
                size: 50.0,
              ),
            ),
            overlayOpacity: 0.8,
            overlayWholeScreen: true,
            child: GCashFormPage()) ,
          '/creditform': (context) => const CreditFormPage(),
          '/receiptform': (context) => ReceiptPage()
        });
  }
}
