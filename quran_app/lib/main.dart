import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/presentation/view/hadith.dart';
import 'package:quran_app/presentation/view/home.dart';
import 'package:quran_app/presentation/view/payer_times.dart';
import 'package:quran_app/presentation/view/quran.dart';
import 'package:quran_app/presentation/view/settings.dart';
import 'package:quran_app/presentation/view/splash_screen.dart';

import 'manager/cubit/hadith_cubit.dart';
import 'manager/cubit/prayer_time_cubit.dart';
import 'manager/cubit/quran_cubit.dart';
import 'manager/cubit/surah_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PrayerTimeCubit()..getAllPrayerTimes(),
        ),
        BlocProvider(create: (context) => QuranCubit()..getQuran()),
        BlocProvider(create: (context) => SurahCubit()..getSurah()),
        BlocProvider(create: (context) => HadithCubit()..getHadiths()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Al_Huda',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (c) => const SplashScreen(),
          HomeScreen.routeName: (c) => const HomeScreen(),
          SettingsScreen.routeName: (c) => const SettingsScreen(),
          QuranScreen.routeName: (c) => const QuranScreen(),
          HadithScreen.routeName: (c) => const HadithScreen(),
          PrayerTimesScreen.routeName: (c) => const PrayerTimesScreen(),
        },
        home: const SplashScreen(),
      ),
    );
  }
}
