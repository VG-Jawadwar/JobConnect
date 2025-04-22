// To parse this JSON data, do
//
//     final postSales = postSalesFromJson(jsonString);

import 'dart:convert';

List<PostSales> postSalesFromJson(String str) => List<PostSales>.from(json.decode(str).map((x) => PostSales.fromJson(x)));

String postSalesToJson(List<PostSales> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostSales {
    String id;
    String title;
    String gender;
    String department;
    String experience;
    String salary;
    String location;
    String companey;

    PostSales({
        required this.id,
      required  this.title,
      required  this.gender,
      required  this.department,
       required this.experience,
       required this.salary,
       required this.location,
       required this.companey,
    });

    factory PostSales.fromJson(Map<String, dynamic> json) => PostSales(
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
