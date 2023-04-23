import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_medina/features/Home/layout/state.dart';
import 'package:visit_medina/features/Owner/Activities/get_cubit/state.dart';
import 'package:visit_medina/shared/components/components.dart';
import 'package:visit_medina/shared/styles/colors.dart';
import 'package:visit_medina/shared/styles/images.dart';
import 'package:visit_medina/shared/styles/styles.dart';
import 'package:intl/intl.dart' as intl;
import '../../../models/OrdersModel.dart';
import '../Activities/get_cubit/cubit.dart';
import 'booking_item.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetMyEventCubit()..getAllOrderOwner(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("الحجوزات"),
        ),
        body: BlocConsumer<GetMyEventCubit, GetMyEventStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            List<OrdersModel> myOrders = GetMyEventCubit.get(context).myOrders;

            return state is GetAllOrderLoadingState
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SafeArea(
                    child: ListView.builder(
                    itemCount: myOrders.length,
                    itemBuilder: (context, index) {
                    DateTime? time = myOrders[index].time;
                      print(
                          intl.DateFormat('HH:MM').format(time!));
                      return BookingItem(
                        ordersModel: myOrders[index],
                      );
                    },
                  ));
          },
        ),
      ),
    );
  }
}
