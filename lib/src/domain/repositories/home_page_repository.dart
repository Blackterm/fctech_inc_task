import 'package:fctech_inc_task/src/domain/entities/user.dart';

abstract class HomePageRepository {
  Future<List<User>> getUserList();
  Future<User?> getUserDetail(String userId);
}
