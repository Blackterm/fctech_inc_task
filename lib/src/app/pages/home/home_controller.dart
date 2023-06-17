import 'package:fctech_inc_task/src/domain/entities/user.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import '../../../domain/repositories/home_page_repository.dart';
import 'home_presenter.dart';

class HomeController extends Controller {
  HomePresenter _presenter;

  HomeController(HomePageRepository homePageRepository)
      : _presenter = HomePresenter(homePageRepository);

  bool islistFetched = false;

  List<User>? usersList;

  @override
  void onInitState() async {
    _presenter.getUserList();
  }

  @override
  void initListeners() {
    _presenter.getUserListOnNext = (List<User>? response) async {
      if (response == null) return;
      if (response.isNotEmpty) {
        if (!islistFetched) {
          usersList = response;
          refreshUI();
        }
      }
    };
  }
}
