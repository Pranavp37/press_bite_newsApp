import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/common/cubit/themeswitch_cubit.dart';
import 'package:news_app/core/theme/app_color.dart';
import 'package:news_app/persentation/account/bloc/bloc/get_user_data_bloc.dart';

class HomeScreenDrawer extends StatelessWidget {
  const HomeScreenDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 28,
                child: Icon(Icons.person),
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
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.model.name!,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          state.model.email!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    );
                  }

                  if (state is GetUserDataError) {
                    return Text(
                      state.error!,
                      style: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.bold),
                    );
                  }

                  return const Column(
                    children: [
                      Text(
                        'User  Name',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Useremail.com',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  );
                },
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
          const Row(
            children: [
              Icon(
                Icons.person,
                size: 30,
                color: AppColors.primaryColor,
              ),
              SizedBox(
                width: 40,
              ),
              Text(
                'Account',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          const Row(
            children: [
              Icon(
                Icons.settings,
                size: 30,
                color: AppColors.primaryColor,
              ),
              SizedBox(
                width: 40,
              ),
              Text(
                'Settings',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          const Row(
            children: [
              Icon(
                Icons.share,
                size: 30,
                color: AppColors.primaryColor,
              ),
              SizedBox(
                width: 40,
              ),
              Text(
                'Share',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              )
            ],
          ),
          const Spacer(),
          Row(
            children: [
              BlocBuilder<ThemeCubit, bool>(
                builder: (context, state) {
                  return Switch(
                    value: state,
                    onChanged: (value) {
                      BlocProvider.of<ThemeCubit>(context).thmeSwich();
                    },
                  );
                },
              ),
              const Spacer(),
              // const SizedBox(
              //   width: 40,
              // ),
              const Text(
                'Theme',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ],
      ),
    );
  }
}
