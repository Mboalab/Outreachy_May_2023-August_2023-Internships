import 'dart:convert';
import 'dart:developer';

import 'package:hospitals_app/constants.dart';
import 'package:http/http.dart';

import '../models/hospital_model.dart';
import '../models/response_model.dart';

class HospitalRepository {
  String url = ApiConstants.baseUrl;

  Future<List<HospitalModel>> getHospitals() async {
    Response response = await get(Uri.parse(url));
    log(response.statusCode.toString());
    log(response.body.toString());
    if (response.statusCode == 200) {
      ResponseModel responseData =
          ResponseModel.fromJson(jsonDecode(response.body));
      log(responseData.hospitals.toString());
      return responseData.hospitals;
    } else {
      throw Exception(response.body.toString());
    }
  }

  Future<List<HospitalModel>> getHospitalsByService(String serviceName) async {
    Response response = await get(Uri.parse(url + ApiConstants.serviceEndpont +serviceName));
    if (response.statusCode == 200) {
      List<HospitalModel> hospitals = jsonDecode(response.body)
          .map<HospitalModel>((json) => HospitalModel.fromJson(json))
          .toList();
      return hospitals;
    } else {
      throw Exception(response.body.toString());
    }
  }
}
