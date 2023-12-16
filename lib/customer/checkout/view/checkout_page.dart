import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/customer/checkout/repository/ordeCollection_repo.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CheckOutScreen extends StatefulWidget {
  CheckOutScreen({
    Key? key,
    required this.grandTotal,
    required this.cartData,
    required this.orderId,
  }) : super(key: key);

  final QuerySnapshot<Map<String, dynamic>> cartData;
  final String orderId;
  final double grandTotal;

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  late Razorpay _razorpay;
  List<Map<String, dynamic>> toBuyCartItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    Fluttertoast.showToast(
        msg: 'Success: ${response.paymentId}', toastLength: Toast.LENGTH_SHORT);
        await OrderCollectionRepo().updateOrder(toBuyCartItems.toSet().toList(), widget.orderId);
      // await OrderollectionRepo().updateOrder(toBuyCartItems.toSet().toList(),widget.orderId);
        
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: 'failed: ${response.code.toString()}',
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: 'ExternalWallet: ${response.walletName}',
        toastLength: Toast.LENGTH_SHORT);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

  void openPayement() async {
    var options = {
      'key': 'rzp_test_XUEC1x5eViSwko',
      'key secret': 'gSIZGg9kjYBLGVLx7396tp6b',
      'amount': widget.grandTotal * 100,
      // organisation name
      'name': 'lakeStore',
      'description': 'online shopping',
      'retry': {
        'enabled': true,
         'max_count': 1
         },
      'sent_sms_hash': true,
      'prefill': {
        'contact': '9018983574', 
        'email': 'lakestore@gmail.com'
        },
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('error:$e');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Checkout',
          style: TextStyle(
            color: Color.fromARGB(255, 117, 115, 115),
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(24.0),
            child: Text('Grand Total:'),
          ),
          Text(
            '${widget.grandTotal}',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 165, 94, 94),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 14, 80, 111),
            ),
            onPressed: () {
              openPayement();
            },
            child: Text(
              'Razor Pay',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.cartData.docs.length,
              itemBuilder: (context, index) {
                final toBuyItems = widget.cartData.docs[index];
                final quantity = int.parse(toBuyItems['quantity'].toString());
                final price =
                    double.parse(toBuyItems['productPrice'].toString());
                final subtotal = quantity * price;

                final singleProductToBuy = {
                  'quantity': quantity,
                  'subtotal': subtotal,
                  'productid': toBuyItems['productId'].toString(),
                };
                toBuyCartItems.add(singleProductToBuy);
                return ListTile(
                  title: Text(
                      '${index + 1},  ${toBuyItems['productName'].toString()}'),
                  subtitle:
                      Text('Quantity : ${toBuyItems['quantity'].toString()}'),
                  trailing: Text(
                      'Price : ${subtotal.toStringAsFixed(2)}'), // Display with 2 decimal places
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}










// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class CheckOutScreen extends StatefulWidget {
//   CheckOutScreen(
//       {super.key,
//       required this.grandTotal,
//       required this.cartData,
//       required this.orderId});

//   final QuerySnapshot<Map<String, dynamic>> cartData;
//   final String orderId;
//   double grandTotal;

//   @override
//   State<CheckOutScreen> createState() => _CheckOutScreenState();
// }

// class _CheckOutScreenState extends State<CheckOutScreen> {
// List<Map<String,dynamic>> toBuyCartItems = [];

//   @override
//   Widget build(BuildContext context) {
    
//     return Scaffold(
//         // backgroundColor: Colors.blueGrey,
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           'checkout',
//           style: TextStyle(color: const Color.fromARGB(255, 117, 115, 115), fontSize: 20),
//         ),
//       ),
//       body: Expanded(
//         child: Column(
//           children: [
//             Container(
//                 child: Padding(
//               padding: const EdgeInsets.all(24.0),
//               child: Text('grand total :'),
//             )),
//             Text(
//               '${widget.grandTotal}',
//               style: TextStyle(
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.bold,
//                   color: const Color.fromARGB(255, 245, 242, 242)),
//             ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                   backgroundColor: Color.fromARGB(255, 14, 80, 111)),
//               onPressed: () {},
//               child: Text(
//                 'Razor Pay',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
      
//             SingleChildScrollView(
//               child: ListView.builder(
                
//                 itemCount: widget.cartData.docs.length,
//                 itemBuilder: (context, index) {
//                   final toBuyItems = widget.cartData.docs[index];
//                   final quantity = int.parse(toBuyItems['quantity'].toString());
//                   final price = double.parse(toBuyItems['proprice'].toString());
//                   final subtotal = quantity * price;
              
//                   final singleProductToBuy = {
//                     'quantity': quantity,
//                     'subtotal': subtotal,
//                     'productid': toBuyItems['productId'].toString()
//                   };
//                       toBuyCartItems.add(singleProductToBuy);
//                       return ListTile(
//                       title: Text('${index+1},  ${toBuyItems['productName'].toString()}'),
//                       subtitle: Text('Quanity : ${toBuyItems['quantity'].toString()}'),
//                       trailing: Text('Price : ${subtotal}'),
//                     );
                      
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
