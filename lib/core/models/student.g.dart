// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) {
  return Student(
    id: json['id'] as String,
    name: json['name'] as String,
    collegeName: json['collegeName'] as String,
    contactNo: json['contactNo'] as String,
    collegeYear: json['collegeYear'] as String,
    address: json['address'] as String,
  );
}

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'collegeName': instance.collegeName,
      'contactNo': instance.contactNo,
      'collegeYear': instance.collegeYear,
      'address': instance.address,
    };
