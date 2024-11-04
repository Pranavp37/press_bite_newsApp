import 'package:flutter/material.dart';
import 'package:news_app/common/helper/is_dark_mode.dart';
import 'package:news_app/core/constant/Images/app_images.dart';

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
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        child: Icon(
                          Icons.person,
                          size: 80,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'User name',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
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
                              Text(
                                'No Email Id',
                                style: TextStyle(
                                  color: context.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
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
                              Icons.phone_android,
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
                                'Contact No',
                                style: TextStyle(
                                  color: context.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                '+91 90481123',
                                style: TextStyle(
                                  color: context.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Align(
                        alignment: Alignment.center,
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
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
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
