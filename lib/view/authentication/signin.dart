import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/signtextform.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:crisptv_media/service/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _passowrd = TextEditingController();
  bool visiblePass = true;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var provider = Provider.of<AuthenticationController>(context);
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
                      const SizedBox(height: 60),
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
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'SignIn With Your Admin Credentials',
                                    style: style.copyWith(
                                      color: AppColor.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),

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
                                controller: _email,
                                fillColor: AppColor.gray,
                                borderColor: AppColor.gray,
                                hintText: 'e.g Isaac@exmple.com',
                              ),

                              /// password
                              const SizedBox(height: 20),
                              Text(
                                'Password',
                                style: style.copyWith(
                                  color: AppColor.white,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 8),
                              SignTextForm(
                                obscureText: visiblePass,
                                controller: _passowrd,
                                fillColor: AppColor.gray,
                                borderColor: AppColor.gray,
                                hintText: 'e.g *******',
                                suffixIcon: InkWell(
                                  onTap: () => setState(() {
                                    visiblePass = !visiblePass;
                                  }),
                                  child: Icon(
                                    visiblePass
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: AppColor.white.withOpacity(0.6),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 50),
                              InkWell(
                                onTap: () async => await provider.signIn(
                                  email: _email.text,
                                  password: _passowrd.text,
                                  context: context,
                                ),
                                child: Container(
                                  width: screenSize.width,
                                  height: 45,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: AppColor.white,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Center(
                                    child: provider.isSignIn
                                        ? SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(
                                              color: AppColor.primaryColor,
                                            ),
                                          )
                                        : Text(
                                            'SIGN IN',
                                            style: style.copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: AppColor.primaryColor,
                                            ),
                                          ),
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
