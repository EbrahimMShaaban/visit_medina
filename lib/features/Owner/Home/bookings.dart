import 'package:flutter/material.dart';
import 'package:visit_medina/features/Home/layout/state.dart';
import 'package:visit_medina/shared/components/components.dart';
import 'package:visit_medina/shared/styles/colors.dart';
import 'package:visit_medina/shared/styles/images.dart';
import 'package:visit_medina/shared/styles/styles.dart';

import 'booking_item.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الحجوزات"),
      ),
      body: SafeArea(
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return BookingItem();
            },
          )),
    );
  }
}


