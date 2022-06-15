import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Data {
  Data({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
