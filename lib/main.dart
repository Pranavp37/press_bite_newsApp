import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:news_app/common/cubit/themeswitch_cubit.dart';
import 'package:news_app/core/theme/app_theme.dart';
import 'package:news_app/data/sources/news_sqflite_provider.dart';
import 'package:news_app/firebase_options.dart';
import 'package:news_app/persentation/account/bloc/bloc/get_user_data_bloc.dart';
import 'package:news_app/persentation/auth/Bloc/bloc/auth_bloc.dart';
import 'package:news_app/persentation/auth/signup_page.dart';
import 'package:news_app/persentation/bookmark/bloc/bloc/bookmark_bloc.dart';
import 'package:news_app/persentation/home/bloc/bloc/getnews_bloc.dart';
import 'package:news_app/persentation/search/bloc/bloc/getsearchnews_bloc.dart';
import 'package:news_app/persentation/splash/views/splash_page.dart';
import 'package:news_app/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => GetUserDataBloc()..add(GetUserDataEvent()),
        ),
      ],
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: state ? ThemeMode.light : ThemeMode.dark,
            navigatorObservers: [FlutterSmartDialog.observer],
            builder: FlutterSmartDialog.init(),
            darkTheme: AppTheme.darkTheme,
            theme: AppTheme.lightTheme,
            home: const SplashPage(),
          );
        },
      ),
    );
  }
}
