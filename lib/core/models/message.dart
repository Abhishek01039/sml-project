import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable(nullable: false)
class Message {
  final String name;
  final String message;
  final String email;

  Message(this.name, this.message, this.email);

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
