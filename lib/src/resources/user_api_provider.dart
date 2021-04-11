import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:awstreams_testapp/src/models/api_model.dart';

class UserApiProvider {
  String baseUrl = 'https://api.mixcloud.com/Mraz/';
  final successCode = 200;

  Future<GetUserAccountModel> fetchUserName() async {
    final response = await http.get(baseUrl);
    if (response.statusCode == successCode) {
      return GetUserAccountModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed to load');
    }
  }

  Future<Pictures> fetchUserPic() async {
    final response = await http.get(baseUrl);
    if (response.statusCode == successCode) {
      return Pictures.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed to load');
    }
  }
}
