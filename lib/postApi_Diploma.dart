// To parse this JSON data, do
//
//     final postDiploma = postDiplomaFromJson(jsonString);

import 'dart:convert';

List<PostDiploma> postDiplomaFromJson(String str) => List<PostDiploma>.from(json.decode(str).map((x) => PostDiploma.fromJson(x)));

String postDiplomaToJson(List<PostDiploma> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostDiploma {
    String id;
    String title;
    String gender;
    String department;
    String experience;
    String salary;
    String location;
    String companey;

    PostDiploma({
        required this.id,
        required this.title,
      required  this.gender,
       required this.department,
       required this.experience,
       required this.salary,
       required this.location,
       required this.companey,
    });

    factory PostDiploma.fromJson(Map<String, dynamic> json) => PostDiploma(
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
