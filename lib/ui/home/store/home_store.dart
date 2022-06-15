import 'package:flutter/foundation.dart';
import 'package:flutter_api_test/services/user_list/reponse/data.dart';
import 'package:flutter_api_test/services/user_list/reponse/user_list.dart';
import 'package:flutter_api_test/services/user_list/user_service.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  HomeStoreBase({
    required UserListService userListService,
  }) : _userListService = userListService {
    loadUsers(1);
  }

  final UserListService _userListService;

  @observable
  List<Data> users = [];

  @observable
  bool isBusy = false;

  @observable
  int totalCount = 0;

  @observable
  int tabIndex = 0;

  Future loadUsers(int pageNumber) async {
    try {
      isBusy = true;
      UserList usersList =
          await _userListService.getUsers(pageNumber: pageNumber);
      totalCount = usersList.total!;
      if (users.length < totalCount) {
        users.addAll(usersList.data as List<Data>);
      }
      isBusy = false;
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }
}
