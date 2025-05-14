import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension Trans on BuildContext {
  String get alFajr => tr('Al-Fajr');
  String get alShorouq => tr('Al-Shorouq');
  String get alDhuhr => tr('Al-Dhuhr');
  String get alAsr => tr('Al-Asr');
  String get alMaghrib => tr('Al-Maghrib');
  String get alIsha => tr('Al-Isha');
  String get prayerTimes => tr('Prayer Times');
  String get quran => tr('Quran');
  String get hadeth => tr('Hadeth');
  String get sepha => tr('Sepha');
  String get settings => tr('Settings');
  String get loading => tr('Loading');
  String get error => tr('Error');
  String get numberOfAyahs => tr('numberOfAyahs');
  String get numberOfTasbeeh => tr('numberOfTasbeeh');
  String get language => tr('language');
  String get darkMode => tr('darkMode');
  String get lightMode => tr('lightMode');
  String get arabic => tr('arabic');
  String get english => tr('english');
}
