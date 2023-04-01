import 'dart:convert';

class HospitalModel {
  int id;
  String email;
  String name;
  String country;
  String region;
  String operatingHours;
  String phoneNumber;
  String services;
  String website;

  HospitalModel(
      {required this.id,
      required this.email,
      required this.name,
      required this.country,
      required this.region,
      required this.operatingHours,
      required this.phoneNumber,
      required this.services,
      required this.website
  });

  factory HospitalModel.fromJson(Map<String, dynamic> json) =>
      HospitalModel(
        id : json["id"],
        email : json["email"],
        name : json["name"],
        country : json["country"],
        region : json["region"],
        operatingHours : json["operating hours"],
        phoneNumber : json["phone number"],
        services : json["services"],
        website : json["website"]
  );
  
  Map<String,dynamic> toJson() {
    return {
      "id" : id,
      "email" : email,
      "name" : name,
      "country" : country,
      "region" : region,
      "operating hours" : operatingHours,
      "phone number" : phoneNumber,
      "services" : services,
      "website" : website
    };
  }
}

HospitalModel hospitalModelFromJson(String str) => HospitalModel.fromJson(jsonDecode(str));
String hospitalModelToJson(HospitalModel data) => jsonEncode(data.toJson());