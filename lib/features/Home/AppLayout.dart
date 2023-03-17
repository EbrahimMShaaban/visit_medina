import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:visit_medina/features/Home/Home.dart';
import 'package:visit_medina/shared/components/navigator.dart';
import 'package:visit_medina/shared/styles/colors.dart';
import 'package:visit_medina/shared/styles/images.dart';
import 'package:visit_medina/shared/styles/styles.dart';

import 'Activities and events.dart';
import 'layout/cubit.dart';
import 'layout/state.dart';

late Widget bodyScerrn = HomeSceen();

class AppLayout extends StatefulWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),

      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {

          var cubit = AppCubit.get(context);
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Scaffold(

              resizeToAvoidBottomInset: false, //new line

              body: SafeArea(
                child: SliderDrawer(
                  key: _key,
                  appBar: const SliderAppBar(
                    appBarColor: Colors.white,
                    // trailing:Text ("dddd"),
                    // title: Image.asset("assets/images/logo.png",color: AppColor.greenDark,height: 150,width: 120,)),
                  ),
                  slider: Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 1.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      color: AppColors.green,
                    ),
                    padding: const EdgeInsets.only(top: 10, bottom: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _SliderMenuItem(
                            title: 'الملف الشخصي',
                            iconData: AppImages.iconPerson,
                            onTap: () {
                              cubit.changeBottomNav(0);
                              print("object");

                            }),
                        _SliderMenuItem(
                            title: 'الصفحة الرئيسية',
                            iconData: AppImages.iconHome,
                            onTap: () {
                              cubit.changeBottomNav(1);
                            }),
                        _SliderMenuItem(
                            title: 'الأنشطة والفعاليات',
                            iconData: AppImages.iconEvent,
                            onTap: () {
                              cubit.changeBottomNav(2);

                            }),
                        _SliderMenuItem(
                            title: 'الأماكن التراثية',
                            iconData: AppImages.iconPlaces,
                            onTap: () {
                              cubit.changeBottomNav(3);

                            }),
                        _SliderMenuItem(
                            title: 'المطاعم',
                            iconData: AppImages.iconRestaurants,
                            onTap: () {}),
                        _SliderMenuItem(
                            title: 'المقاهي',
                            iconData: AppImages.iconCoffe,
                            onTap: () {
                              // signout(context);
                            }),
                      ],
                    ),
                  ),
                  child:  cubit.screen[cubit.currentIndex],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


class _SliderMenuItem extends StatefulWidget {
  final String title;
  final String iconData;
  final Function()? onTap;

  const _SliderMenuItem({Key? key,
    required this.title,
    required this.iconData,
    required this.onTap})
      : super(key: key);

  @override
  State<_SliderMenuItem> createState() => _SliderMenuItemState();
}

class _SliderMenuItemState extends State<_SliderMenuItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(widget.title,
            textAlign: TextAlign.end,
            style: TextStyle(color: AppColors.white, fontSize: 20)),
        // leading: Image.asset(iconData),
        trailing: Image.asset(widget.iconData),
        // onTap: () => onTap?.call(title)
        onTap: () {
          widget.onTap;
        });
  }
}
