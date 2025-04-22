// To parse this JSON data, do
//
//     final postHealthcare = postHealthcareFromJson(jsonString);

import 'dart:convert';

List<PostHealthcare> postHealthcareFromJson(String str) => List<PostHealthcare>.from(json.decode(str).map((x) => PostHealthcare.fromJson(x)));

String postHealthcareToJson(List<PostHealthcare> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostHealthcare {
    String id;
    String title;
    String gender;
    String department;
    String experience;
    String salary;
    String location;
    String companey;

    PostHealthcare({
       required this.id,
      required  this.title,
      required  this.gender,
      required  this.department,
      required  this.experience,
      required  this.salary,
      required  this.location,
      required  this.companey,
    });

    factory PostHealthcare.fromJson(Map<String, dynamic> json) => PostHealthcare(
        id: json["Id"],
        title: json["title"],
        gender: json["gender"],
        department: json["department"],
        experience: json["experience"],
        salary: json["salary"],
        location: json["location"],
        companey: json["companey"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "title": title,
        "gender": gender,
        "department": department,
        "experience": experience,
        "salary": salary,
        "location": location,
        "companey": companey,
    };
}
