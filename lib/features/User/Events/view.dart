import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_medina/features/User/Events/get_cubit/state.dart';

import '../../../models/addeventmodel.dart';
import '../../../shared/components/end_point.dart';
import '../../../shared/network/local/shared_preferences.dart';
import '../../../shared/styles/colors.dart';
import 'activityItem.dart';
import 'get_cubit/cubit.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({Key? key, this.event}) : super(key: key);
  final String? event;

  @override
  Widget build(BuildContext context) {
    UID = CacheHelper.getData(key: 'uId');

    return BlocProvider(
      create: (context) => GetAllEventCubit()..getAllEvent(event),
      child: Scaffold(
        appBar: AppBar(

          actions: [
            Directionality(
                textDirection: TextDirection.ltr,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppColors.green,
                    )))
          ],
          leading: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
          ),
        ),
        body: BlocConsumer<GetAllEventCubit, GetAllEventStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            List<EventModel> allPosts = GetAllEventCubit.get(context).allPosts;

            return state is GetAllEventOrPlaceLoadingState
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return ActivityItem(model: allPosts[index],);
                    },
                    itemCount: allPosts.length);
          },
        ),
      ),
    );
  }
}
