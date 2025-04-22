// To parse this JSON data, do
//
//     final postMarketing = postMarketingFromJson(jsonString);

import 'dart:convert';

List<PostMarketing> postMarketingFromJson(String str) => List<PostMarketing>.from(json.decode(str).map((x) => PostMarketing.fromJson(x)));

String postMarketingToJson(List<PostMarketing> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostMarketing {
    String id;
    String title;
    String gender;
    String department;
    String experience;
    String salary;
    String location;
    String companey;

    PostMarketing({
        required this.id,
       required this.title,
       required this.gender,
       required this.department,
       required this.experience,
      required  this.salary,
       required this.location,
       required this.companey,
    });

    factory PostMarketing.fromJson(Map<String, dynamic> json) => PostMarketing(
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
