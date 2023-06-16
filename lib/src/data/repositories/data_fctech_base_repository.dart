import 'package:fctech_inc_task/src/domain/repositories/fctech_base_repository.dart';
import 'package:http/http.dart' as http;
import 'package:http/src/response.dart';

class DataFcTechBaseRepository implements FcTechBaseRepository {
  static final DataFcTechBaseRepository _instance =
      DataFcTechBaseRepository._internal();
  DataFcTechBaseRepository._internal();
  factory DataFcTechBaseRepository() => _instance;

  String baseUrl = "https://jsonplaceholder.typicode.com/";

  @override
  Future<Response> executeFcTechRequest(
      String requestType, String path, header, body) async {
    Response response;
    var url = Uri.parse(baseUrl + path);

    try {
      switch (requestType) {
        case "GET":
          response = await http.get(
            url,
            headers: header,
          );
          break;
        case "POST":
          response = await http.post(
            url,
            headers: header,
            body: body,
          );
          break;
        case "DELETE":
          response = await http.delete(
            url,
            headers: header,
          );
          break;
        default:
          throw Exception("");
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response;
      } else {
        throw Exception("");
      }
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }
}
