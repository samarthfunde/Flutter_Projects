import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      title: 'Razorpay Payment Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Razorpay Payment Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    // Commenting out the cancellation event for now
    // _razorpay.on(Razorpay.EVENT_PAYMENT_CANCEL, _handlePaymentCancel);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void _openCheckout() {
    var options = {
      'key': 'rzp_test_n6Uk5cknXhD41i',
      'amount': 1000,
      'name': 'Payment for Fine T-Shirt',
      'description': 'Purchase of T-Shirt',
      'prefill': {'contact': '7498122398', 'email': 'test@razorpay.com'},
      'theme': {'color': '#3399cc'},
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print("Error opening Razorpay: ${e.toString()}");
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(msg: "Payment Success: ${response.paymentId}");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "Payment Failed: ${response.message}");
  }

  // Uncomment if you want to use this handler
  /*
  void _handlePaymentCancel() {
    Fluttertoast.showToast(msg: "Payment Cancelled");
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: _openCheckout,
          child: const Text('Pay Now'),
        ),
      ),
    );
  }
}
