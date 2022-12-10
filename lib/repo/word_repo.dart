import 'package:dicti/model/word_response.dart';
import 'package:dicti/service/http_service.dart';

class WordRepository {
  Future<List<WordResponse>?> getWordsFromDictionary(String query) async {
    try {
      final response = await HttpService.getResquest("en_US/$query");
      if (response.statusCode == 200) {
        final result = wordResponseFromJson(response.body);
        return result;
      } else {
        return null;
      }
    } catch (err) {
      throw err;
    }
  }
}
