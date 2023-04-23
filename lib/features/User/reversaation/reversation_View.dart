import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_medina/features/Home/layout/state.dart';
import 'package:visit_medina/features/Owner/Activities/get_cubit/state.dart';
import 'package:visit_medina/features/User/Events/get_cubit/state.dart';
import 'package:visit_medina/shared/components/components.dart';
import 'package:visit_medina/shared/styles/colors.dart';
import 'package:visit_medina/shared/styles/images.dart';
import 'package:visit_medina/shared/styles/styles.dart';
import 'package:intl/intl.dart' as intl;
import '../../../models/OrdersModel.dart';
import '../../Owner/Home/booking_item.dart';
import '../Events/get_cubit/cubit.dart';


class ReversationUserScreen extends StatefulWidget {
  const ReversationUserScreen({Key? key}) : super(key: key);

  @override
  State<ReversationUserScreen> createState() => _ReversationUserScreenState();
}

class _ReversationUserScreenState extends State<ReversationUserScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllEventCubit()..getAllOrderUser(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("الحجوزات"),
        ),
        body: BlocConsumer<GetAllEventCubit, GetAllEventStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            List<OrdersModel> myOrders = GetAllEventCubit.get(context).myOrders;

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
