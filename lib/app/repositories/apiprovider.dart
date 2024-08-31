import 'package:http/http.dart' as http;
import 'package:machinetest_kalbas/app/resources/apikeys.dart';
class ApiProvider {
  Future<http.Response> fetchNews()async{
    final response=await http.get(Uri.parse('${ApiKeys.apiurl}v2/everything?q=sports&apiKey=${ApiKeys.apiKey}'));
    return response;
  }
}