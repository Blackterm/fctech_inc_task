import 'dart:async';
import 'package:fctech_inc_task/src/domain/entities/user.dart';
import 'package:fctech_inc_task/src/domain/repositories/home_page_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetUserDetail extends UseCase<User?, GetUserDetailParams> {
  final HomePageRepository _homePageRepository;

  GetUserDetail(this._homePageRepository);
  @override
  Future<Stream<User?>> buildUseCaseStream(GetUserDetailParams? params) async {
    StreamController<User?> controller = StreamController();
    try {
      User? list = await _homePageRepository.getUserDetail(params!.userId);
      controller.add(list);
      controller.close();
    } catch (e, st) {
      print(e);
      print(st);
      controller.addError(e, st);
    }
    return controller.stream;
  }
}

class GetUserDetailParams {
  final String userId;

  GetUserDetailParams(this.userId);
}
