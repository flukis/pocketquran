import 'package:pocketquran/data/network/base_api_service.dart';
import 'package:pocketquran/data/network/end_point_lists/surah_end_point.dart';
import 'package:pocketquran/data/network/network_api_service.dart';
import 'package:pocketquran/models/ayah_in_surah.dart';
import 'package:pocketquran/repo/ayah_in_surah/list_ayah_in_surah_repo.dart';

class AyahListInSurahRepoImpl implements AyahListInSurahRepo {
  final BaseApiService _apiSvc = NetworkApiService();
  @override
  Future<AyahListOfSurah?> getAyahListInSurah(int numOfSurah) async {
    try {
      dynamic resp =
          await _apiSvc.getResponse("${SurahEndPoints().getLists}/$numOfSurah");

      final jsonData = AyahListOfSurah.fromJson(resp);
      return jsonData;
    } catch (e) {
      rethrow;
    }
  }
}
