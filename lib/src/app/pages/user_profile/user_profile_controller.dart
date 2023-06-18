import 'package:fctech_inc_task/src/app/pages/user_profile/user_profile_presenter.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../domain/entities/user.dart';
import '../../../domain/repositories/home_page_repository.dart';

class UserProfileController extends Controller {
  UserProfilePresenter _presenter;
  final String userId;
  UserProfileController(HomePageRepository homePageRepository, this.userId)
      : _presenter = UserProfilePresenter(homePageRepository);

  bool islistFetched = false;

  User? userDetail;

  @override
  void onInitState() async {
    _presenter.getUserDetail(userId);
  }

  @override
  void initListeners() {
    _presenter.getUserDetailOnNext = (User? response) async {
      if (response == null) return;

      if (!islistFetched) {
        userDetail = response;

        refreshUI();
      }
    };
  }
}
