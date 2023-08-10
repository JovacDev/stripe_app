import 'package:flutter/material.dart';
import 'package:stripe_app/pages/pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stripe App',
      initialRoute: 'home',
      routes: {
        'home': (context) => const HomePage(),
        'payment_full': (context) => const PaymentFullPage(),
        'card': (context) => const CardPage()
      },
      theme: ThemeData.light().copyWith(
          primaryColor: const Color(0xFF284879),
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF284879)),
          scaffoldBackgroundColor: const Color(0xFF21232A)),
    );
  }
}
