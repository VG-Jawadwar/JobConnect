// To parse this JSON data, do
//
//     final postIt = postItFromJson(jsonString);

import 'dart:convert';

List<PostIt> postItFromJson(String str) => List<PostIt>.from(json.decode(str).map((x) => PostIt.fromJson(x)));

String postItToJson(List<PostIt> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostIt {
    String id;
    String title;
    String gender;
    String department;
    String experience;
    String salary;
    String location;
    String companey;

    PostIt({
        required this.id,
      required  this.title,
      required  this.gender,
      required  this.department,
      required  this.experience,
     required   this.salary,
      required  this.location,
      required  this.companey,
    });

    factory PostIt.fromJson(Map<String, dynamic> json) => PostIt(
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
