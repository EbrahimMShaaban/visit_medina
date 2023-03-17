import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../styles/styles.dart';
import 'constants.dart';

class ButtonTemplate extends StatelessWidget {
  ButtonTemplate({
    Key? key,
    required this.color,
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
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),      child: MaterialButton(
        minWidth: minwidth,
        height: minheight,
        onPressed: onPressed,
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon == null
                  ? SizedBox()
                  : Center(
                      child: Icon(icon, size: 21, color: AppColors.white),
                    ),
              SizedBox(
                width: 5,
              ),
              Center(
                child: Text(text1,
                    style: AppTextStyles.bold.copyWith(fontSize: 30),),
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
  }) : super(key: key);

  String hintText;
  TextEditingController controller;
  Function? validator;
  Widget? icon;
  bool isPassword;

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
                          color: AppColors.Bluehint),
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
                  borderRadius: BorderRadius.all(Radius.circular(15))))),
    );
  }
}

class BottomText extends StatelessWidget {
  const BottomText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: "",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
              children: [
                TextSpan(
                    text: "FCIS - ",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: "Facult of comuters \n and informatoin science"),
              ])),
    );
  }
}

void showMyDialog(String _message, BuildContext context) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //  backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: EdgeInsets.zero,
          title: Text("Error"),
          content: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(_message),
          ),
          actions: [
            Center(
              child: TextButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ))),
                  onPressed: () {
                    Navigator.pop(context, "ok");
                  },
                  child: const Text(
                    "ok",
                    style:
                        TextStyle(color: AppColors.primarycolor, fontSize: 22),
                  )),
            )
          ],
        );
      });
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
