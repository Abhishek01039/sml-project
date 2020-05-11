import 'package:json_annotation/json_annotation.dart';

part 'student.g.dart';

@JsonSerializable(nullable: false)
class Student {
  final String id;
  final String name;
  // final String collegeName;
  // final String contactNo;
  // final String collegeYear;
  final String email;
  final String password;
  Student(
      {this.id,
      this.name,
      // this.collegeName,
      // this.contactNo,
      // this.collegeYear,
      this.email,
      this.password});

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);
  Map<String, dynamic> toJson() => _$StudentToJson(this);
}
