import 'package:http/http.dart';

abstract class FcTechBaseRepository {
  Future<Response> executeFcTechRequest(
      String requestType, String path, var header, var body);
}
