import 'package:flutter/material.dart';

import '../../../shared/styles/colors.dart';
import 'activityItem.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title:const Text('عرض الفعاليات والأنشطة'),
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
          //  child: Image.asset(AppImages.drawer, height: 30),
        ),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return ActivityItem();
          },
          itemCount: 10),
    );
  }
}
