import 'package:awstreams_testapp/src/models/api_model.dart';
import 'package:awstreams_testapp/src/resources/user_api_provider.dart';

class UserRepository {
  UserApiProvider userApiProvider = UserApiProvider();

  Future<GetUserAccountModel> fetchUserName() =>
      userApiProvider.fetchUserName();

  Future<Pictures> fetchUserPic() =>
      userApiProvider.fetchUserPic();
}