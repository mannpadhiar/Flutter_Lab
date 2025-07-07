import 'package:get/get.dart';
import 'package:sem_5/lab-10/user_model.dart';

import 'database_model.dart';

class DatabaseController extends GetxController {
  LocalDatabase _localDatabase = LocalDatabase();

  RxList<User> users = <User>[].obs;

  RxBool isEdit = false.obs;

  @override
  void onInit() async{
    super.onInit();
    await initDataBaseGetX();
  }

  Future<void> initDataBaseGetX() async {
    await _localDatabase.initDatabase();
    await fetchDataGetX();
  }

  Future<void> addDataGetX(User user) async {
    await _localDatabase.addData(user);
    await fetchDataGetX();
  }

  Future<void> fetchDataGetX() async {
    (await _localDatabase.fetchData()).forEach(
      (element) => users.add(User.toUser(element)),
    );
  }

  Future<void> deleteDataGetX(int id) async {
    await _localDatabase.deleteUser(id);
    await fetchDataGetX();
  }

  Future<void> updateDataGetX(User user) async {
    await _localDatabase.updateUser(user);
    await fetchDataGetX();
  }
}
