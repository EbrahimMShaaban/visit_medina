import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:visit_medina/features/User/view.dart';
import 'package:visit_medina/shared/styles/styles.dart';

import '../../../shared/components/navigator.dart';

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({Key? key}) : super(key: key);

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  void initState(){
    Timer(const Duration(seconds: 3), () {
      navigateAndReplace(context,  const VisitorView());
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/payment.gif",height: 300),
              Text(
                "تم الدفع بنجاح",
                style: AppTextStyles.w800.copyWith(fontSize: 30),
              ),     Text(
                "شكرا لاختيارك visitMedina",
                style: AppTextStyles.w800.copyWith(fontSize: 20),
              ),
            ]),
      ),
    );
  }
}
