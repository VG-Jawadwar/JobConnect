// To parse this JSON data, do
//
//     final postHr = postHrFromJson(jsonString);

import 'dart:convert';

List<PostHr> postHrFromJson(String str) => List<PostHr>.from(json.decode(str).map((x) => PostHr.fromJson(x)));

String postHrToJson(List<PostHr> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostHr {
    String id;
    String title;
    String gender;
    String department;
    String experience;
    String salary;
    String location;
    String companey;

    PostHr({
       required this.id,
      required  this.title,
      required  this.gender,
      required  this.department,
    required  this.experience,
        required this.salary,
        required this.location,
       required this.companey,
    });

    factory PostHr.fromJson(Map<String, dynamic> json) => PostHr(
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
