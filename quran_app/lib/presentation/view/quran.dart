import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/custom_widgets/quran_item.dart';
import 'package:quran_app/core/utils/myConstants.dart';
import 'package:quran_app/manager/cubit/quran_cubit.dart';
import 'package:quran_app/manager/state/quran_state.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});
  static const String routeName = 'Quran Screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: MyColors.appColor,
          title: const Text(
            'القران الكريم ',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: BlocBuilder<QuranCubit, QuranState>(
            builder: (context, state) {
              if (state is SuccessState) {
                return CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(child: SizedBox(height: 15)),
                    SliverList.separated(
                      itemBuilder:
                          (c, index) => QuranItem(
                            number: '${state.quran[index]['number']}',
                            arName: '${state.quran[index]['name']}',
                            enName: '${state.quran[index]['englishName']}',
                            numberOfAya:
                                '${state.quran[index]['numberOfAyahs']}',
                          ),
                      separatorBuilder:
                          (c, index) => const SizedBox(height: 15),
                      itemCount: state.quran.length,
                    ),
                  ],
                );
              } else if (state is ErrorState) {
                return Column(
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
                    children: [CircularProgressIndicator(), Text('Loading...')],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
