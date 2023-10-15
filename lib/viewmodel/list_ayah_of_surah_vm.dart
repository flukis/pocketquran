import 'package:flutter/material.dart';
import 'package:pocketquran/data/response/api_response.dart';
import 'package:pocketquran/models/ayah_in_surah.dart';
import 'package:pocketquran/repo/ayah_in_surah/list_ayah_in_surah_repo_impl.dart';

class AyahListInSurahVM extends ChangeNotifier {
  final _listAyah = AyahListInSurahRepoImpl();

  ApiResponse<AyahListOfSurah> listAyah = ApiResponse.loading();

  void _setListAyah(ApiResponse<AyahListOfSurah> resp) {
    listAyah = resp;
    notifyListeners();
  }

  Future<void> fetchAyahList(int numOfSurah) async {
    _setListAyah(ApiResponse.loading());
    _listAyah
        .getAyahListInSurah(numOfSurah)
        .then((value) => _setListAyah(ApiResponse.completed(value)))
        .onError((error, stackTrace) =>
            _setListAyah(ApiResponse.error(error.toString())));
  }
}
