import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:stripe_app/data/cards.dart';
import 'package:stripe_app/helpers/helpers.dart';
import 'package:stripe_app/pages/pages.dart';
import 'package:stripe_app/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pagar'),
        actions: [
          IconButton(
              onPressed: () async {
                showLoading(context);
                await Future.delayed(Duration(seconds: 1));
                Navigator.pop(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Stack(children: [
        Positioned(
          width: size.width,
          height: size.height,
          top: size.height * 0.2,
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.89),
            physics: const BouncingScrollPhysics(),
            itemCount: cards.length,
            itemBuilder: (context, index) {
              final card = cards[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, navegarFadeIn(context, CardPage()));
                },
                child: Hero(
                  tag: card.cardNumber,
                  child: CreditCardWidget(
                    cardNumber: card.cardNumber,
                    expiryDate: card.expiracyDate,
                    cardHolderName: card.cardHolderName,
                    cvvCode: card.cvv,
                    showBackView: false,
                    onCreditCardWidgetChange: (p0) {},
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 0,
          child: TotalPayButton(),
        )
      ]),
    );
  }
}
