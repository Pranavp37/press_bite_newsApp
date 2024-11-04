import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/common/cubit/themeswitch_cubit.dart';
import 'package:news_app/core/theme/app_theme.dart';
import 'package:news_app/data/sources/news_sqflite_provider.dart';
import 'package:news_app/persentation/bookmark/bloc/bloc/bookmark_bloc.dart';
import 'package:news_app/persentation/bottomnav/bottom_nav.dart';
import 'package:news_app/persentation/home/bloc/bloc/getnews_bloc.dart';
import 'package:news_app/persentation/search/bloc/bloc/getsearchnews_bloc.dart';
import 'package:news_app/service_locator.dart';

Future<void> main() async {
  runApp(const MyApp());
  await setUp();
  await s1<NewsSqfliteProvider>().initDb();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetnewsBloc(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => GetsearchnewsBloc(),
        ),
        BlocProvider(
          create: (context) => BookmarkBloc(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: state ? ThemeMode.light : ThemeMode.dark,
            darkTheme: AppTheme.darkTheme,
            theme: AppTheme.lightTheme,
            home: const BottomNav(),
          );
        },
      ),
    );
  }
}
