import 'package:awstreams_testapp/src/resources/user_repository.dart';
import 'package:awstreams_testapp/src/models/api_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc {
  UserRepository _repository = UserRepository();
  final _userFetcher = PublishSubject<GetUserAccountModel>();
  final _picFetcher = PublishSubject<Pictures>();

  Stream<GetUserAccountModel> get userData => _userFetcher.stream;
  Stream<Pictures> get userPic => _picFetcher.stream;

  fetchUserData() async {
    GetUserAccountModel getUserAccountModel = await _repository.fetchUserName();
    _userFetcher.sink.add(getUserAccountModel);
  }
  fetchUserPic() async {
    Pictures pictures = await _repository.fetchUserPic();
    _picFetcher.sink.add(pictures);
  }

  dispose() {
    _userFetcher.close();
    _picFetcher.close();
  }
}

final userBloc = UserBloc();
