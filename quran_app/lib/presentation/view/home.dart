import 'package:flutter/material.dart';
import 'package:quran_app/core/assets/app_images.dart';
import 'package:quran_app/core/custom_widgets/bottomIconImage.dart';

import 'hadith.dart';
import 'payer_times.dart';
import 'quran.dart';
import 'sepha.dart';
import 'settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'Home Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentScreen = 4;

  dynamic screens = [
    const PrayerTimesScreen(),
    const QuranScreen(),
    const HadithScreen(),
    const TasbeehScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child: screens[currentScreen]),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFFb7935f),
          selectedLabelStyle: const TextStyle(fontSize: 13),
          unselectedLabelStyle: const TextStyle(fontSize: 12),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          currentIndex:
              currentScreen, // it is very important to make change in style of label
          onTap: (int index) {
            setState(() {
              currentScreen = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: BottomIconsImage(imageName: AppImages.mosqueImage),
              label: 'Prayer Times',
            ),
            BottomNavigationBarItem(
              icon: BottomIconsImage(imageName: AppImages.quranImage),
              label: 'Quran',
            ),
            BottomNavigationBarItem(
              icon: BottomIconsImage(imageName: AppImages.hadithImage),
              label: 'Hadith',
            ),
            BottomNavigationBarItem(
              icon: BottomIconsImage(imageName: AppImages.sephaImage),
              label: 'Sepha',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings, size: 28, color: Colors.white),
              label: 'Settings',
            ),
          ],
          //very important
          type:
              BottomNavigationBarType
                  .fixed, // This ensures all items are fixed and the background color is applied correctly
        ),
      ),
    );
  }
}
