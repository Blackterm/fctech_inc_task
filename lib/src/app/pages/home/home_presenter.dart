import 'package:fctech_inc_task/src/domain/entities/user.dart';
import 'package:fctech_inc_task/src/domain/repositories/home_page_repository.dart';
import 'package:fctech_inc_task/src/domain/usecases/get_user_list.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomePresenter extends Presenter {
  late Function getUserListOnNext;
  late Function getUserListOnError;

  final GetUserList _getUserList;

  HomePresenter(HomePageRepository _homePageRepository)
      : _getUserList = GetUserList(_homePageRepository);

  void getUserList() {
    _getUserList.execute(_GetUserListObserver(this));
  }

  @override
  void dispose() {
    _getUserList.dispose();
  }
}

class _GetUserListObserver extends Observer<List<User>> {
  final HomePresenter _presenter;

  _GetUserListObserver(this._presenter);

  @override
  void onComplete() {}

  @override
  void onError(e) {
    _presenter.getUserListOnError(e);
  }

  @override
  void onNext(List<User>? response) {
    _presenter.getUserListOnNext(response);
  }
}
