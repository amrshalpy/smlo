
import 'dart:io';

import 'package:elhamdania/componant/const.dart';
import 'package:elhamdania/cubit/home_cubit.dart';
import 'package:elhamdania/moduel/define_screen/define_screen.dart';
import 'package:elhamdania/moduel/splash_screen/splash_scren.dart';
import 'package:elhamdania/share/cache_helper.dart';
import 'package:elhamdania/share/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  HttpOverrides.global = MyHttpOverrides();
  await CacheHelper.init();
  uid = CacheHelper.getShared(key: kUid) != null
      ? CacheHelper.getShared(key: kUid)
      : null;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
            create: (context) => HomeCubit()
              ..getCategories()
              ..getNewOffers()
              ..getPrivacy()
              // ..fetchData()
            ..getDetails()
            ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Al hamdania',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
