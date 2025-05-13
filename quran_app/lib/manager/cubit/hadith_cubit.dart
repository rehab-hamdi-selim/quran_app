import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/manager/state/hadith_state.dart';
import 'package:quran_app/network/api_services.dart';

class HadithCubit extends Cubit<HadithState> {
  ApiServices apiServices = ApiServices();

  HadithCubit() : super(InitialState());

  getHadiths() async {
    try {
      var json = await apiServices.get(
        endpoint:
            r'https://hadithapi.com/api/hadiths/?apiKey=$2y$10$WEe34r7yf4xyctnGvv824FV8C3XsRlJVJ9Pqd9vtmesGsjaYkhS',
      );
      var hadiths = json['hadiths']['data'];
      emit(SuccessState(hadiths: hadiths));
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}
