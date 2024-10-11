import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/theme/app_theme.dart';
import 'package:news_app/persentation/bottomnav/bottom_nav.dart';
import 'package:news_app/persentation/home/bloc/bloc/getnews_bloc.dart';
import 'package:news_app/service_locator.dart';

Future<void> main() async {
  runApp(const MyApp());
  await setUp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetnewsBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        darkTheme: AppTheme.darkTheme,
        theme: AppTheme.lightTheme,
        home: const BottomNav(),
      ),
    );
  }
}
