import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../styles/styles.dart';
import 'constants.dart';
import 'package:flutter/material.dart';
import '../../../../shared/components/components.dart';
import '../../../../shared/components/constants.dart';
import '../../../../shared/styles/colors.dart';
import '../../../../shared/styles/styles.dart';
class ButtonTemplate extends StatelessWidget {
  ButtonTemplate({
    Key? key,
    required this.color,
     this.colortext,
    required this.text1,
    required this.onPressed,
    this.text2 = "",
    this.text3 = "",
    this.icon,
    this.minwidth = 318,
    this.minheight = 60,
    this.fontSize = 18,
  }) : super(key: key);
  Color color;
  Color? colortext;
  String text1;
  String text2;
  String text3;
  double minwidth;
  double minheight;
  double fontSize;
  IconData? icon;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: MaterialButton(
        minWidth: minwidth,
        height: minheight,
        onPressed: onPressed,
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ Center(
              child: Text(text1,
                style: AppTextStyles.bold.copyWith(
                    fontSize: fontSize, color: colortext == null ?AppColors.white:colortext),),
            ),

              SizedBox(
                width: 10,
              ),
              icon == null
                  ? SizedBox()
                  : Center(
                child: Icon(icon, size: 35, color: AppColors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldTemplate extends StatefulWidget {
  TextFieldTemplate({
    Key? key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.isPassword = false,
    this.icon,
    this.lines = 1
  }) : super(key: key);

  String hintText;
  TextEditingController controller;
  Function? validator;
  Widget? icon;
  bool isPassword;
  int lines;

  @override
  State<TextFieldTemplate> createState() => _TextFieldTemplateState();
}

class _TextFieldTemplateState extends State<TextFieldTemplate> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: TextFormField(
        maxLines: widget.lines,
          cursorColor: AppColors.blue,
          obscureText: widget.isPassword ? _isObscure : false,
          controller: widget.controller,
          validator: (value) => widget.validator!(value),
          // style: AppTextStyles.hittext,
          decoration: InputDecoration(
              prefixIcon: widget.icon,
              hintText: widget.hintText,
              border: InputBorder.none,
              suffixIcon: widget.isPassword
                  ? IconButton(
                  splashRadius: 20,
                  icon: Icon(
                      _isObscure == true
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: AppColors.green),
                  onPressed: () => setState(() => _isObscure = !_isObscure))
                  : null,
              filled: true,
              fillColor: AppColors.greenlight,

              // labelStyle: AppTextStyles.hittext,
              // hintStyle: AppTextStyles.hittext,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(15))),

              disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
            focusedErrorBorder:  const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(15))),

          )),
    );
  }
}


void showMyDialog({required BuildContext context, required Function()? ontap, required String message}) async {
  return await AwesomeDialog(
    context: context,
    dialogType: DialogType.info,

    animType: AnimType.rightSlide,
    title:message ,
descTextStyle: TextStyle(color: AppColors.primarycolor ),
    desc: ' هل انت متاكد انك تريد $message ؟',
    btnCancelText: "لا",


    btnCancelOnPress: (){},
    btnOkText: "نعم",
    btnOkColor: AppColors.primarycolor,
    btnOkOnPress: ontap,
  ).show();
}

///
class NavigateToOption extends StatelessWidget {
  NavigateToOption({Key? key, required this.name, required this.onPressed})
      : super(key: key);
  String name;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 70,
        width: 320,
        child: Material(
          color: AppColors.materialGrey,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: [
                Text(name,
                    style:
                    TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                Spacer(),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: MaterialButton(
                      padding: EdgeInsets.zero,
                      color: AppColors.primarycolor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      onPressed: onPressed),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TeamsName extends StatelessWidget {
  TeamsName({Key? key, required this.name, required this.onPressed})
      : super(key: key);
  String name;

  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: 100,
        width: 1,
        child: MaterialButton(
            padding: EdgeInsets.all(10),
            color: AppColors.materialGrey,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: RichText(
              text: TextSpan(
                text: 'Team ',
                // style: AppTextStyles.w300.apply(
                //   color: Colors.black,
                // ),
                children: <TextSpan>[
                  TextSpan(
                    text: name,
                    //  style: AppTextStyles.lrTitles
                  ),
                ],
              ),
            ),
            onPressed: onPressed),
      ),
    );
  }
}



Future commentReply(
    BuildContext context,
    TextEditingController controller
    )
{
  return  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          title: const Center(child: Text('رد')),
          titleTextStyle: AppTextStyles.bold.apply(color: AppColors.black),
          //titlePadding: const EdgeInsets.symmetric(vertical: 20),
          // elevation: 10,
          insetPadding: const EdgeInsets.all(10),
          shape: const RoundedRectangleBorder(
              side: BorderSide(
                //color: AppColors.pink,
              ),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          content: SizedBox(
            width: 100,
            child: SingleChildScrollView(
              child: TextFieldTemplate(
                hintText: 'رد على التعليق',
                icon: null, controller: controller,

              ),
            ),
          ),
          actions: <Widget>[
            Center(
              child: ButtonTemplate(
                minwidth:100,
                color: AppColors.primarycolor,
                onPressed: () {},
                text1: 'ارسال',

              ),
            ),

          ],
        );
      });

}