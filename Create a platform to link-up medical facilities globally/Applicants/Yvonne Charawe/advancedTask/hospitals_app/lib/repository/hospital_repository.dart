import 'dart:convert';
import 'dart:developer';
import 'package:hospitals_app/bloc/hospital_bloc.dart';
import 'package:hospitals_app/constants.dart';
import 'package:http/http.dart';
import '../models/response_model.dart';

class HospitalRepository {
  String url = ApiConstants.baseUrl;

  Future<void> getHospitals() async {
    Response response = await get(Uri.parse(url));
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      ResponseModel responseData =
          ResponseModel.fromJson(jsonDecode(response.body));
      hospitalBloc.hospitalController.sink.add(responseData.hospitals);
    } else {
      throw Exception(response.body.toString());
    }
  }
}

HospitalRepository hospitalRepository = HospitalRepository();
