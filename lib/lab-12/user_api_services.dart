import 'package:get/get.dart';
import 'user_api_model.dart';

class UserApiService extends GetConnect {
  final String baseUrl = "https://67c5368cc4649b9551b5aa00.mockapi.io/mmony/temp";

  Future<Response> getUsers() async {
    return await get(baseUrl);
  }

  Future<Response> postUser(UserApi user) async {
    return await post(baseUrl, user.toJson());
  }

  Future<Response> putUser(String id, UserApi user) async {
    return await put("$baseUrl/$id", user.toJson());
  }

  Future<Response> deleteUser(String id) async {
    return await delete("$baseUrl/$id");
  }
}
