import 'dart:async';

import 'package:fctech_inc_task/src/domain/entities/user.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../repositories/home_page_repository.dart';

class GetUserList extends UseCase<List<User>, void> {
  final HomePageRepository _homePageRepository;

  GetUserList(this._homePageRepository);
  @override
  Future<Stream<List<User>?>> buildUseCaseStream(void params) async {
    StreamController<List<User>> controller = StreamController();
    try {
      List<User> getUser = await _homePageRepository.getUserList();
      controller.add(getUser);
      controller.close();
    } catch (e, st) {
      print(e);
      print(st);
      controller.addError(e, st);
    }
    return controller.stream;
  }
}
