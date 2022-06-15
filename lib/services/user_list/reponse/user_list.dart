import 'package:flutter_api_test/services/user_list/reponse/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_list.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class UserList {
  UserList({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  final int? page;
  final int? perPage;
  final int? total;
  final int? totalPages;
  final List<Data>? data;

  factory UserList.fromJson(Map<String, dynamic> json) =>
      _$UserListFromJson(json);
  Map<String, dynamic> toJson() => _$UserListToJson(this);
}
