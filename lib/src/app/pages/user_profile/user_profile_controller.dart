import 'package:fctech_inc_task/src/app/pages/user_profile/user_profile_presenter.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../domain/repositories/home_page_repository.dart';

class UserProfileController extends Controller {
  UserProfilePresenter _presenter;

  UserProfileController(HomePageRepository homePageRepository)
      : _presenter = UserProfilePresenter(homePageRepository);
  @override
  void initListeners() {
    // TODO: implement initListeners
  }
}
