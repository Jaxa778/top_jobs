import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_jobs/Utils/app_images.dart';
import 'package:top_jobs/views/screens/register_screens/screens/sigin_up_screen.dart';
import 'package:top_jobs/Utils/screen_size_utils.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
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
                    SvgPicture.asset(AppImages.welcomeBack),
                    SizedBox(height: 15 * h),
                    SvgPicture.asset(AppImages.lorem),
                  ],
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30, top: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(AppImages.email),
                  SizedBox(height: 10 * h),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SvgPicture.asset(AppImages.password),
                  SizedBox(height: 10 * h),
                  TextFormField(
                    obscureText: isShow,
                    decoration: InputDecoration(
                      hintText: "Password your email",
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isShow = !isShow;
                          });
                        },
                        icon:
                            isShow
                                ? Icon(
                                  Icons.visibility,
                                  color: Color(0xff60778C),
                                )
                                : Icon(
                                  Icons.visibility_off,
                                  color: Color(0xff60778C),
                                ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  // SizedBox(height: 20 * h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // Container(
                          //   width: 25,
                          //   height: 25,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(5),
                          //     color: Color(0xffE6E1FF),
                          //   ),
                          // ),
                          Checkbox(
                            value: isTrue,
                            onChanged: (value) {
                              setState(() {
                                isTrue = value!;
                              });
                            },
                          ),
                          SizedBox(width: w * 15),
                          SvgPicture.asset(AppImages.rememberMe),
                        ],
                      ),
                      SvgPicture.asset(AppImages.forgotPassword),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30 * h),
            Column(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => SiginUpScreen()),
                    );
                  },
                  child: Container(
                    width: 270,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff130160),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Image.asset(AppImages.loginScreen)],
                    ),
                  ),
                ),
                SizedBox(height: 20 * h),
                InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {},
                  child: Container(
                    width: 270,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffD6CDFE),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(AppImages.google),
                            SizedBox(width: 10 * h),
                            SvgPicture.asset(AppImages.signInWithGoogle),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20 * h),
                SvgPicture.asset(AppImages.youDontHave),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
