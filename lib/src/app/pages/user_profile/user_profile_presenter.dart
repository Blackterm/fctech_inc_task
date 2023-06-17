import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../domain/entities/user.dart';
import '../../../domain/repositories/home_page_repository.dart';
import '../../../domain/usecases/get_user_detail.dart';

class UserProfilePresenter extends Presenter {
  late Function getUserDetailOnNext;
  late Function getUserDetailOnError;

  final GetUserDetail _getUserDetail;

  UserProfilePresenter(HomePageRepository _homePageRepository)
      : _getUserDetail = GetUserDetail(_homePageRepository);

  void getUserDetail(String userId) {
    _getUserDetail.execute(
        _GetUserDetailObserver(this), GetUserDetailParams(userId));
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}

class _GetUserDetailObserver extends Observer<User?> {
  final UserProfilePresenter _presenter;

  _GetUserDetailObserver(this._presenter);

  @override
  void onComplete() {
    // TODO: implement onComplete
  }

  @override
  void onError(e) {
    _presenter.getUserDetailOnError(e);
  }

  @override
  void onNext(User? response) {
    _presenter.getUserDetailOnNext(response);
  }
}
