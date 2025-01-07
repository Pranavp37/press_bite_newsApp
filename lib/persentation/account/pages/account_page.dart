import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:news_app/common/helper/is_dark_mode.dart';
import 'package:news_app/core/constant/Images/app_images.dart';
import 'package:news_app/domin/usecases/signout_usecase.dart';
import 'package:news_app/persentation/account/bloc/bloc/get_user_data_bloc.dart';
import 'package:news_app/persentation/auth/signin_page.dart';
import 'package:news_app/service_locator.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Image.asset(
          AppImages.appLogo,
          height: 150,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        child: Icon(
                          Icons.person,
                          size: 80,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BlocBuilder<GetUserDataBloc, GetUserDataState>(
                        builder: (context, state) {
                          if (state is GetUserLoading) {
                            return const CircularProgressIndicator();
                          }
                          if (state is GetUserDataLoaded) {
                            return Text(
                              state.model.name!,
                              style: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            );
                          }

                          if (state is GetUserDataError) {
                            return Text(
                              state.error!,
                              style: const TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            );
                          }

                          return const Text(
                            'User name',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          );
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  height: MediaQuery.of(context).size.height / 2.2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: context.isDarkMode
                          ? Colors.grey[900]
                          : Colors.grey[300],
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.blue[100],
                              border: Border.all(
                                  width: 2, color: Colors.blue.shade900),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                                child: Icon(
                              Icons.email,
                              color: Colors.blue[900],
                            )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email ID',
                                style: TextStyle(
                                  color: context.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 17,
                                ),
                              ),
                              BlocBuilder<GetUserDataBloc, GetUserDataState>(
                                builder: (context, state) {
                                  if (state is GetUserLoading) {
                                    return const CircularProgressIndicator();
                                  }
                                  if (state is GetUserDataLoaded) {
                                    return Text(
                                      state.model.email!,
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    );
                                  }

                                  if (state is GetUserDataError) {
                                    return Text(
                                      state.error!,
                                      style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    );
                                  }

                                  return const Text(
                                    'no emial found',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  );
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.2,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () async {
                            try {
                              await s1<SignoutUsecase>().call();

                              SmartDialog.showToast('Logout');
                              Navigator.pushReplacement(
                                  // ignore: use_build_context_synchronously
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignInPage(),
                                  ));
                            } catch (e) {
                              SmartDialog.showToast(e.toString());
                            }
                          },
                          child: Container(
                            height: 60,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.blue.shade900,
                            ),
                            child: const Center(
                                child: Text(
                              'Log out',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
