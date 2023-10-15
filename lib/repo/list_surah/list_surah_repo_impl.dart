import 'package:pocketquran/data/network/base_api_service.dart';
import 'package:pocketquran/data/network/end_point_lists/surah_end_point.dart';
import 'package:pocketquran/data/network/network_api_service.dart';
import 'package:pocketquran/models/surah.dart';
import 'package:pocketquran/repo/list_surah/list_surah_repo.dart';

class SurahListRepoImpl implements SurahListRepo {
  final BaseApiService _apiSvc = NetworkApiService();
  @override
  Future<ListSurah?> getSurahList() async {
    try {
      dynamic resp = await _apiSvc.getResponse(SurahEndPoints().getLists);
      final jsonData = ListSurah.fromJson(resp);
      return jsonData;
    } catch (e) {
      rethrow;
    }
  }
}
