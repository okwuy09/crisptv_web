import 'package:crisptv/component/color.dart';
import 'package:crisptv/component/signtextform.dart';
import 'package:crisptv/component/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController passowrd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 750, //screenSize.height * 1.2,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/homevideo.gif',
                fit: BoxFit.cover,
              ),
              ClipRRect(
                // Clip it cleanly.
                child: Container(
                  height: screenSize.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColor.primaryColor.withOpacity(0.7),
                        AppColor.primaryColor,
                        AppColor.primaryColor,
                        AppColor.primaryColor,
                      ],
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenSize.width / 20),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: screenSize.width < 800
                              ? InkWell(
                                  onTap: () => context.go('/'),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              AppColor.white.withOpacity(0.5)),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.arrow_back_ios_rounded,
                                        color: AppColor.white.withOpacity(0.9),
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                )
                              : InkWell(
                                  onTap: () => context.go('/'),
                                  child: Container(
                                    height: 40,
                                    width: 105,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              AppColor.white.withOpacity(0.5)),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.arrow_back_ios_rounded,
                                            color:
                                                AppColor.white.withOpacity(0.9),
                                            size: 20,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            'Go Back',
                                            style: style.copyWith(
                                              color: AppColor.white
                                                  .withOpacity(0.9),
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      //const SizedBox(height: 10),
                      Expanded(
                        child: Container(
                          width: screenSize.width < 800
                              ? screenSize.width / 1.05
                              : screenSize.width / 2.8,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            //color: AppColor.primaryColor.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    'Sign up to get steady daily updates',
                                    style: style.copyWith(
                                      color: AppColor.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(height: 30),
                                Container(
                                  width: screenSize.width,
                                  height: 50,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: AppColor.white,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/google_icon.png'),
                                        const SizedBox(width: 10),
                                        Text(
                                          'Sign up with google',
                                          style: style.copyWith(
                                              color: AppColor.primaryColor),
                                        )
                                      ]),
                                ),
                                const SizedBox(height: 35),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 24, right: 24),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Divider(
                                          color:
                                              AppColor.white.withOpacity(0.4),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        'OR',
                                        style: style.copyWith(
                                          fontSize: 12,
                                          color:
                                              AppColor.white.withOpacity(0.4),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Divider(
                                          color:
                                              AppColor.white.withOpacity(0.4),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 35),
                                Text(
                                  'Name',
                                  style: style.copyWith(
                                    color: AppColor.white,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                SignTextForm(
                                  obscureText: false,
                                  controller: name,
                                  fillColor: AppColor.gray,
                                  borderColor: AppColor.gray,
                                  hintText: 'e.g Isaac',
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'Email',
                                  style: style.copyWith(
                                    color: AppColor.white,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                SignTextForm(
                                  obscureText: false,
                                  controller: email,
                                  fillColor: AppColor.gray,
                                  borderColor: AppColor.gray,
                                  hintText: 'e.g Isaac@exmple.com',
                                ),

                                /// password
                                const SizedBox(height: 12),
                                Text(
                                  'Password',
                                  style: style.copyWith(
                                    color: AppColor.white,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                SignTextForm(
                                  obscureText: false,
                                  controller: passowrd,
                                  fillColor: AppColor.gray,
                                  borderColor: AppColor.gray,
                                  hintText: 'e.g *******',
                                ),
                                const SizedBox(height: 40),
                                Container(
                                    width: screenSize.width,
                                    height: 45,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    decoration: BoxDecoration(
                                      color: AppColor.white,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'SIGN UP',
                                        style: style.copyWith(
                                            fontSize: 14,
                                            color: AppColor.primaryColor),
                                      ),
                                    )),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
