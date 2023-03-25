import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:visit_medina/shared/components/components.dart';
import 'package:visit_medina/shared/components/constants.dart';
import 'package:visit_medina/shared/styles/images.dart';

import '../../../shared/styles/colors.dart';
import '../../../shared/styles/styles.dart';

@immutable
class RatingView extends StatefulWidget {
  RatingView({Key? key}) : super(key: key);

  @override
  State<RatingView> createState() => _RatingViewState();
}

class _RatingViewState extends State<RatingView> {
  final TextEditingController controller = TextEditingController();

  @override
  double? showRating ;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  actions: [
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
        title: Text('شاركنا رأيك'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
          child: Container(
            width: MediaQueryHelper.sizeFromWidth(context, 1),
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 20),
                  height: 100,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.green),
                  child: Center(
                      child: Text("كيف كانت تجربتك مع سكة حد يد الحجاز ؟",
                          textAlign: TextAlign.center,
                          style: AppTextStyles.bold.copyWith(fontSize: 20))),
                ),
                Container(
                    width: MediaQueryHelper.sizeFromWidth(context, 1),
                    child: TextFieldTemplate(
                      hintText: '',
                      controller: controller,
                      lines: 7,
                    )),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  textDirection: TextDirection.rtl,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: RatingBar.builder(
                        textDirection: TextDirection.rtl,
                        initialRating: 3,
                        minRating: 1,
                        itemSize: 30,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 2),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          if (kDebugMode) {
                            print(rating);
                          }
                          setState(() {
                            showRating = rating;
                          });
                        },
                      ),
                    ),

                  ],
                ),

                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 70,
                  child: ButtonTemplate(
                      color: AppColors.green,
                      minwidth: 50,
                      text1: 'أرسال',
                      onPressed: () {}),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
