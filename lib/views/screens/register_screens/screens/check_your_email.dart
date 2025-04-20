
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:top_jobs/Utils/app_images.dart';
import 'package:top_jobs/views/screens/register_screens/screens/successfully.dart';
import 'package:top_jobs/Utils/screen_size_utils.dart';

class CheckYourEmail extends StatefulWidget {
  const CheckYourEmail({super.key});

  @override
  State<CheckYourEmail> createState() => _CheckYourEmailState();
}

class _CheckYourEmailState extends State<CheckYourEmail> {
  bool isTrue = false;
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    double w = ScreenSize.widthFactor(context);
    double h = ScreenSize.heightFactor(context);
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      endDrawerEnableOpenDragGesture: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: w * 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppImages.check),
                    SizedBox(height: 15 * h),
                    SvgPicture.asset(AppImages.we_Have),
                  ],
                ),
              ],
            ),
            SizedBox(height: 60 * h),
            SvgPicture.asset(AppImages.undraw_Message),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30, top: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (ctx) => Successfully()),
                          );
                        },
                        child: Container(
                          width: 320,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff130160),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [SvgPicture.asset(AppImages.open_Your)],
                          ),
                        ),
                      ),
                      SizedBox(height: 20 * h),
                      InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {},
                        child: Container(
                          width: 320,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffD6CDFE),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [SvgPicture.asset(AppImages.back)],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20 * h),
            SvgPicture.asset(AppImages.you_Have),
          ],
        ),
      ),
    );
  }
}
