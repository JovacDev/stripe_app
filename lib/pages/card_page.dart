import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:stripe_app/models/credit_card_model.dart';
import 'package:stripe_app/widgets/widgets.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final card = CreditCardModel(
        cardNumberHidden: '4242',
        cardNumber: '4242424242424242',
        brand: 'visa',
        cvv: '213',
        expiracyDate: '01/25',
        cardHolderName: 'Fernando Herrera');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pagar'),
      ),
      body: Stack(
        children: [
          Container(),
          Hero(
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
          Positioned(
            bottom: 0,
            child: TotalPayButton(),
          ),
        ],
      ),
    );
  }
}
