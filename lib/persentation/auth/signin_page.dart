import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/common/helper/is_dark_mode.dart';
import 'package:news_app/core/constant/Images/app_images.dart';
import 'package:news_app/core/theme/app_color.dart';
import 'package:news_app/data/model/user_model.dart';
import 'package:news_app/domin/usecases/signin_usecase.dart';
import 'package:news_app/domin/usecases/signup_usecase.dart';
import 'package:news_app/persentation/auth/Bloc/bloc/auth_bloc.dart';
import 'package:news_app/persentation/auth/signup_page.dart';
import 'package:news_app/persentation/auth/widgets/auth_button/auth_button.dart';
import 'package:news_app/persentation/auth/widgets/authtextField/auth_text_field.dart';
import 'package:news_app/persentation/bottomnav/bottom_nav.dart';
import 'package:news_app/service_locator.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController EmailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Image.asset(
          AppImages.appLogo,
          height: MediaQuery.sizeOf(context).height * 0.2,
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SingleChildScrollView(
          child: Form(
            key: globalKey,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
                Lottie.asset('lib/core/assets/Animation - 1736143391754.json',
                    height: MediaQuery.sizeOf(context).height * 0.2),
                const SizedBox(height: 25),
                AuthTextField(
                  controller: EmailController,
                  label: 'Email',
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return "All Fields are Requied";
                    } else if (!p0.contains('@')) {
                      return 'please enter valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                AuthTextField(
                  controller: passwordController,
                  label: 'Password',
                  isPassword: true,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return "All Fields are Requied";
                    } else if (p0.length < 6) {
                      return "password must have 6 charachers";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                AuthButton(
                    ontap: () async {
                      if (globalKey.currentState!.validate()) {
                        try {
                          var res = await s1<SigninUsecase>().call(
                            parms: UserModel(
                                email: EmailController.text,
                                password: passwordController.text),
                          );
                          if (res == null) {
                            Navigator.pushReplacement(
                              // ignore: use_build_context_synchronously
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BottomNav(),
                              ),
                            );
                            SmartDialog.showToast('Register Successfully');
                          } else {
                            SmartDialog.showToast(
                                "email or password not registerd");
                          }
                        } catch (e) {
                          SmartDialog.showToast(e.toString());
                        }
                      }
                    },
                    title: 'Submit'),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You don\'t have an account ?',
              style: TextStyle(
                  color: context.isDarkMode ? Colors.white : Colors.black),
            ),
            const SizedBox(
              width: 2,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignupPage(),
                    ));
              },
              child: const Text(
                'Register',
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
