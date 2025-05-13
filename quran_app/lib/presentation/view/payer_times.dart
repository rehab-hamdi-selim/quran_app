import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/assets/app_images.dart';
import 'package:quran_app/core/custom_widgets/prayer_time_item.dart';
import 'package:quran_app/core/models/prayer_time_model.dart';
import 'package:quran_app/core/utils/myConstants.dart';
import 'package:quran_app/manager/cubit/prayer_time_cubit.dart';

import '../../manager/state/prayer_time_state.dart';

class PrayerTimesScreen extends StatefulWidget {
  const PrayerTimesScreen({super.key});
  static const String routeName = "home";

  @override
  State<PrayerTimesScreen> createState() => _PrayerTimesScreenState();
}

class _PrayerTimesScreenState extends State<PrayerTimesScreen> {
  late int endTime;

  @override
  void initState() {
    super.initState();
    // Set the countdown duration (e.g., 2 minutes from now)
    endTime = DateTime.now().millisecondsSinceEpoch;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = ScreenUtils.getScreenHeight(context);
    double screenWidth = ScreenUtils.getScreenWidth(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.backgroundLight),
              fit: BoxFit.cover,
            ),
          ),
          child: BlocBuilder<PrayerTimeCubit, AppState>(
            builder: (context, state) {
              if (state is SuccessState) {
                return ListView(
                  children: [
                    SizedBox(height: screenHeight * 0.1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              '${state.times['date']['hijri']['month']['ar']}',
                              style: const TextStyle(fontSize: 25),
                            ),
                            Text(
                              '${state.times['date']['hijri']['date']}',
                              style: const TextStyle(
                                fontSize: 25,
                                color: Colors.orange,
                              ),
                            ),
                          ],
                        ),
                        //Use CountdownTimer
                        CircularCountDownTimer(
                          width: screenWidth * 0.40,
                          height: screenHeight * 0.33,
                          initialDuration:
                              _calculateInitialDuration()
                                  .inSeconds, // Convert to seconds
                          duration:
                              _calculateDuration()
                                  .inSeconds, // Convert to seconds
                          //backgroundColor: Colors.black,
                          ringColor: Colors.white,
                          fillColor: const Color(0xFFb7935f),
                          textStyle: const TextStyle(
                            fontSize: 28.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          textFormat: CountdownTextFormat.HH_MM_SS,
                          strokeWidth: 8.0,
                          strokeCap: StrokeCap.round,
                          isReverse: false,
                          isReverseAnimation: false,
                          isTimerTextShown: true,
                          onComplete: () {
                            //print('Countdown Ended');
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PrayerTimeItem(
                            prayerTimeModel: PrayerTimeModel(
                              imageName: AppImages.fogImage,
                              prayerName: 'الفجر',
                              prayerTime: '${state.times['timings']['Fajr']}',
                            ),
                          ),
                          PrayerTimeItem(
                            prayerTimeModel: PrayerTimeModel(
                              imageName: AppImages.sunriseImage,
                              prayerName: 'الشروق',
                              prayerTime:
                                  '${state.times['timings']['Sunrise']}',
                            ),
                          ),
                          PrayerTimeItem(
                            prayerTimeModel: PrayerTimeModel(
                              imageName: AppImages.sunImage,
                              prayerName: 'الظهر',
                              prayerTime: '${state.times['timings']['Dhuhr']}',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PrayerTimeItem(
                            prayerTimeModel: PrayerTimeModel(
                              imageName: AppImages.cloudImage,
                              prayerName: 'العصر',
                              prayerTime: '${state.times['timings']['Sunset']}',
                            ),
                          ),
                          PrayerTimeItem(
                            prayerTimeModel: PrayerTimeModel(
                              imageName: AppImages.sunsetImage,
                              prayerName: 'المغرب',
                              prayerTime:
                                  '${state.times['timings']['Maghrib']}',
                            ),
                          ),
                          PrayerTimeItem(
                            prayerTimeModel: PrayerTimeModel(
                              imageName: AppImages.moonImage,
                              prayerName: 'العشاء',
                              prayerTime: '${state.times['timings']['Isha']}',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else if (state is ErrorState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: [
                    Center(child: Text('Error -> ${state.errorMessage}')),
                  ],
                );
              } else {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 20,
                    children: [
                      CircularProgressIndicator(),
                      Text('Loading Prayer Times...'),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Duration _calculateInitialDuration() {
    // Get the current time
    DateTime currentTime = DateTime.now();
    return Duration(
      hours: currentTime.hour,
      minutes: currentTime.minute,
      seconds: currentTime.second,
    );
  }

  Duration _calculateDuration() {
    // Replace this with the logic to determine the next prayer time
    // For demonstration, let's assume the next prayer time is 4:25 AM
    var nextPrayerTime = DateTime.now().add(
      const Duration(hours: 24, minutes: 25, seconds: 60),
    );

    // Calculate the difference between the next prayer time and the current time
    DateTime currentTime = DateTime.now();
    return nextPrayerTime.difference(currentTime);
  }
}
