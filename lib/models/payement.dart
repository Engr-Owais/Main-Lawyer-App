import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:stripe_payment/stripe_payment.dart';

class StripeTransactionResponse {
  String message;
  bool success;
  String paymentConfirmId;
  String client_secret;
  StripeTransactionResponse(
      {this.message, this.success, this.client_secret, this.paymentConfirmId});
}

class StripeService {
  static String apiBase = 'https://api.stripe.com/v1';
  static String paymentApiUrl = '${StripeService.apiBase}/payment_intents';
  static String secret =
      'sk_test_51Hu8jDBMIupSIAhVdlK5mSBgrhG87wslxiZD6yKvMWwsrb7Q27Jk3IgSkkYmaAspIx23uktyQWEG8STxNG45AFjn00I2lGd8W0';
  static Map<String, String> headers = {
    'Authorization': 'Bearer ${StripeService.secret}',
    'Content-Type': 'application/x-www-form-urlencoded'
  };

  static init() {
    StripePayment.setOptions(StripeOptions(
        publishableKey:
            'pk_test_51Hu8jDBMIupSIAhVySyj8DUx09dusHxn0h2HZy6IBBVQMlZYe3LMYGqOyyFhiV3AvGbkRBibGR59LWKtXGJzwtBo00aeyzdLBM',
        merchantId: "Test",
        androidPayMode: 'test'));
  }

  static Future<StripeTransactionResponse> payWithNewCard(
      double amount, String currency) async {
    try {
      var paymentMethod = await StripePayment.paymentRequestWithCardForm(
          CardFormPaymentRequest());

      var paymentIntentRes =
          await StripeService.createPaymentIntent(amount, currency);

      var response = await StripePayment.confirmPaymentIntent(PaymentIntent(
          clientSecret: paymentIntentRes['client_secret'],
          paymentMethodId: paymentMethod.id));

      if (response.status == 'succeeded') {
        return new StripeTransactionResponse(
          message: 'Transaction successful',
          success: true,
          paymentConfirmId: paymentIntentRes['id'],
          client_secret: paymentIntentRes['client_secret'],
        );
      }
      print(paymentIntentRes.toString());
    } catch (e) {
      return new StripeTransactionResponse(
          message: 'Transaction Failed Error ${e.toString()}', success: false);
    }
  }

  static Future<Map<String, dynamic>> createPaymentIntent(
      double amount, String currency) async {
    try {
      var amount1 = amount.round();
      Map<String, dynamic> body = {
        'amount': '$amount1',
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var respose = await http.post(StripeService.paymentApiUrl,
          body: body, headers: StripeService.headers);
      return jsonDecode(respose.body);
    } catch (e) {
      print("err charing user: " + e.toString());
    }
    return null;
  }
}
