import 'package:http/http.dart' as http;

class HttpService {
  static final baseUrl = "https://api.dictionaryapi.dev/api/v2/entries/";

  static Future<http.Response> getResquest(endpoint) async {
    http.Response response;
    final url = Uri.parse("$baseUrl$endpoint");
    try {
      response = await http.get(url);
    } catch (err) {
      throw err;
    }
    return response;
  }
}
