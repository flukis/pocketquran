import 'package:flutter/material.dart';
import 'package:pocketquran/data/response/api_response.dart';
import 'package:pocketquran/models/surah.dart';
import 'package:pocketquran/repo/list_surah/list_surah_repo_impl.dart';

class SurahListVM extends ChangeNotifier {
  final _listSurahRepo = SurahListRepoImpl();

  ApiResponse<ListSurah> listSurah = ApiResponse.loading();

  void _setListSurah(ApiResponse<ListSurah> resp) {
    listSurah = resp;
    notifyListeners();
  }

  Future<void> fetchListSurah() async {
    _setListSurah(ApiResponse.loading());
    _listSurahRepo
        .getSurahList()
        .then((value) => _setListSurah(ApiResponse.completed(value)))
        .onError((error, stackTrace) =>
            _setListSurah(ApiResponse.error(error.toString())));
  }
}
