import 'package:machinetest_kalbas/app/repositories/apiprovider.dart';

class ApiRepository {
  final ApiProvider _apiProvider=ApiProvider();
  Future<dynamic> fetchNews()async{
    return _apiProvider.fetchNews();
  }
}