import 'dart:convert';

import 'package:fctech_inc_task/src/data/repositories/data_fctech_base_repository.dart';
import 'package:fctech_inc_task/src/domain/entities/user.dart';
import 'package:fctech_inc_task/src/domain/repositories/home_page_repository.dart';
import 'package:http/http.dart' as http;

class DataHomepageRepository implements HomePageRepository {
  static final DataHomepageRepository _instance =
      DataHomepageRepository._internal();
  DataHomepageRepository._internal()
      : _dataFcTechBaseRepository = DataFcTechBaseRepository();
  factory DataHomepageRepository() => _instance;
  final DataFcTechBaseRepository _dataFcTechBaseRepository;

  List<User> _userList = [];
  User? _userDetail;

  @override
  Future<List<User>> getUserList() async {
    try {
      http.Response response =
          await _dataFcTechBaseRepository.executeFcTechRequest(
        "GET",
        "users",
      );

      List jsonResponse = json.decode(response.body);

      _userList =
          jsonResponse.map((currentNew) => User.fromJson(currentNew)).toList();

      return _userList;
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }

  @override
  Future<User?> getUserDetail(String userId) async {
    try {
      http.Response response =
          await _dataFcTechBaseRepository.executeFcTechRequest(
        "GET",
        "users/$userId",
      );

      _userDetail = User.fromJson(jsonDecode(response.body));

      return _userDetail;
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }
}
