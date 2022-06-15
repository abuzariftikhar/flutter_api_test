import 'package:dio/dio.dart';
import 'package:flutter_api_test/services/user_list/reponse/user_list.dart';
import 'package:retrofit/retrofit.dart';
part 'user_service.g.dart';

@RestApi()
abstract class UserListService {
  factory UserListService(Dio dio) = _UserListService;

  @GET('/users')
  Future<UserList> getUsers({
    @Query('page') required int pageNumber,
  });
}
