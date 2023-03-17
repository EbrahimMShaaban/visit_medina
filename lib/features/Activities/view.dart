import 'package:flutter/material.dart';
import 'package:visit_medina/shared/styles/colors.dart';
class Activities extends StatelessWidget {
  const Activities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,

              color: AppColors.green,

            )
          ],
        ),
      )
    );
  }
}
