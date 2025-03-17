import 'package:flutter/material.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class Paymentmodel {
  String name;
  List<String> steps;

  Paymentmodel({required this.name, required this.steps});

  static List<Paymentmodel> getpayment() {
    List<Paymentmodel> payments = [];

    payments.add(Paymentmodel(name: 'Pawpay', steps: [
      "Select Pawpay as your payment method.",
      "Click the 'Buy Now' button below.",
      "Pawpay will open in the Pawrenting app.",
      "Review your payment details carefully.",
      "Enter your Password for authentication.",
      "Wait for the payment to be processed.",
      "You will receive a confirmation once the payment is successful."
    ]));

    payments.add(Paymentmodel(name: 'Gopay', steps: [
      "Select GoPay for payment.",
      "Click the 'Buy Now' button below.",
      "GoPay will open in the Pawrenting app.",
      "Review and confirm your payment details.",
      "Enter your GoPay PIN to complete the payment."
    ]));
    payments.add(Paymentmodel(name: 'OVO', steps: [
      "Select Ovo for payment.",
      "Click 'Buy Now'.",
      "Enter your Ovo number and confirm.",
      "Complete the payment in the Ovo app."
    ]));
    payments.add(Paymentmodel(name: 'Dana', steps: [
      "Select Dana as payment method.",
      "Click 'Buy Now'.",
      "Confirm in the Dana app.",
      "Enter your PIN and finish the transaction."
    ]));
    payments.add(Paymentmodel(name: 'BCA Virtual Account', steps: [
      "Select BCA Virtual Account.",
      "Copy the generated VA number.",
      "Open your BCA Mobile app or ATM.",
      "Paste the VA number and confirm payment."
    ]));
    payments.add(Paymentmodel(name: 'Cash', steps: [
      "Select Cash for payment.",
      "Confirm your order.",
      "Pay at the delivery point."
    ]));

    return payments;
  }
}
