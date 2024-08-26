import 'package:http/http.dart' as http;
import '../../Constants/strings.dart';
import '../Models/characters.dart';


class CharactersApi {
  Future<List<Result>?> getCharacters() async {
    try {
         final response = await http.get(Uri.parse('${BaseUrl}character'));
    if (response.statusCode == 200) {
      return charactersFromJson(response.body).results;
    } else {
      return null;
    }
    }
    catch (e) {
      return null;
    }
 
  }
}
