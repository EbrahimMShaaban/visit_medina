import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_medina/features/User/Events/activityItem.dart';
import 'package:visit_medina/features/User/Events/get_cubit/state.dart';

import '../../../models/addeventmodel.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/navigator.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/styles/images.dart';
import '../../../shared/styles/styles.dart';
import '../../registration/regist_screen/view.dart';
import '../Events/event_details.dart';
import '../Events/get_cubit/cubit.dart';

class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      GetAllEventCubit()
        ..getAllFavorite(),
      child: BlocConsumer<GetAllEventCubit, GetAllEventStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          List<EventModel> allFavorite = GetAllEventCubit.get(context).allFavorite;

          return Scaffold(
              appBar: AppBar(
                title: Text('المفضلة'),
              ),
              body: state is GetAllFavoriteLoadingState
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  :  ListView.builder(
                  itemBuilder: (context, index) {
                    return ActivityItem(model: allFavorite[index],);
                  },
                  itemCount: allFavorite.length)
          );
        },
      ),
    );
  }
}
