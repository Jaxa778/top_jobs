
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_jobs/Utils/app_images.dart';
import 'package:top_jobs/views/screens/register_screens/screens/sigin_up.dart';
import 'package:top_jobs/Utils/screen_size_utils.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                          SvgPicture.asset(AppImages.remember_Me),
                        ],
                      ),
                      SvgPicture.asset(AppImages.forgot_Password),
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
                      MaterialPageRoute(builder: (ctx) => SiginUp()),
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
                      children: [Image.asset(AppImages.login)],
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
                            SvgPicture.asset(AppImages.sign_In_With_Google),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20 * h),
                SvgPicture.asset(AppImages.you_Dont_Have),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
