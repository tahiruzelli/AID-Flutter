import 'package:AID/Controllers/BalanceController/balance_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';

class PaymentInformation extends StatelessWidget {
  BalanceController balanceController = Get.find();
  OutlineInputBorder? border = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey.withOpacity(0.7),
      width: 2.0,
    ),
  );
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: <Widget>[
          const SizedBox(
            height: 15,
          ),
          CreditCardWidget(
            glassmorphismConfig: balanceController.useGlassMorphism.value
                ? Glassmorphism.defaultConfig()
                : null,
            cardNumber: balanceController.cardNumber.value,
            expiryDate: balanceController.expiryDate.value,
            cardHolderName: balanceController.cardHolderName.value,
            cvvCode: balanceController.cvvCode.value,
            showBackView: balanceController.isCvvFocused.value,
            obscureCardNumber: true,
            obscureCardCvv: true,
            isHolderNameVisible: true,
            cardBgColor: Colors.red,
            backgroundImage: 'assets/images/card_bg.png',
            isSwipeGestureEnabled: true,
            onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
            customCardTypeIcons: <CustomCardTypeIcon>[
              CustomCardTypeIcon(
                cardType: CardType.mastercard,
                cardImage: Image.asset(
                  'assets/mastercard.png',
                  height: 48,
                  width: 48,
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              CreditCardForm(
                formKey: formKey,
                obscureCvv: true,
                obscureNumber: true,
                cardNumber: balanceController.cardNumber.value,
                cvvCode: balanceController.cvvCode.value,
                isHolderNameVisible: true,
                isCardNumberVisible: true,
                isExpiryDateVisible: true,
                cardHolderName: balanceController.cardHolderName.value,
                expiryDate: balanceController.expiryDate.value,
                themeColor: Colors.blue,
                textColor: Colors.white,
                cardNumberDecoration: InputDecoration(
                  labelText: 'Number',
                  hintText: 'XXXX XXXX XXXX XXXX',
                  hintStyle: const TextStyle(color: Colors.white),
                  labelStyle: const TextStyle(color: Colors.white),
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                expiryDateDecoration: InputDecoration(
                  hintStyle: const TextStyle(color: Colors.white),
                  labelStyle: const TextStyle(color: Colors.white),
                  focusedBorder: border,
                  enabledBorder: border,
                  labelText: 'Expired Date',
                  hintText: 'XX/XX',
                ),
                cvvCodeDecoration: InputDecoration(
                  hintStyle: const TextStyle(color: Colors.white),
                  labelStyle: const TextStyle(color: Colors.white),
                  focusedBorder: border,
                  enabledBorder: border,
                  labelText: 'CVV',
                  hintText: 'XXX',
                ),
                cardHolderDecoration: InputDecoration(
                  hintStyle: const TextStyle(color: Colors.white),
                  labelStyle: const TextStyle(color: Colors.white),
                  focusedBorder: border,
                  enabledBorder: border,
                  labelText: 'Card Holder',
                ),
                onCreditCardModelChange: onCreditCardModelChange,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  primary: const Color(0xff1b447b),
                ),
                child: Container(
                  margin: const EdgeInsets.all(12),
                  child: const Text(
                    'Onayla',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'halter',
                      fontSize: 14,
                      package: 'flutter_credit_card',
                    ),
                  ),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    balanceController.onCreateButtonRequestButtonPressed();
                  } else {
                    print('invalid!');
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    balanceController.cardNumber.value = creditCardModel!.cardNumber;
    balanceController.expiryDate.value = creditCardModel.expiryDate;
    balanceController.cardHolderName.value = creditCardModel.cardHolderName;
    balanceController.cvvCode.value = creditCardModel.cvvCode;
    balanceController.isCvvFocused.value = creditCardModel.isCvvFocused;
  }
}
