import 'hospital_model.dart';

class ResponseModel {
  final String title;
  final List<HospitalModel> hospitals;

  ResponseModel({required this.title, required this.hospitals});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    List<HospitalModel> hospitals = [];
    hospitals = json['hospitals'].map<HospitalModel>((json) => HospitalModel.fromJson(json)).toList();
    return ResponseModel(
      title: json['title'],
      hospitals: hospitals,
    );
  }
}