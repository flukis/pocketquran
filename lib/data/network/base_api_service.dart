abstract class BaseApiService {
  final String baseUrl = "https://quran-api-weld.vercel.app/";

  Future<dynamic> getResponse(String url);
}
