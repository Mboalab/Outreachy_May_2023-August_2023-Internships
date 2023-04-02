import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospitals_app/bloc/hospital_bloc.dart';
import 'package:http/http.dart';

import '../constants.dart';
import '../models/hospital_model.dart';
import '../models/response_model.dart';
import '../utils/color_from_hex.dart';
import '../widgets/hospital_widget.dart';

class Hospitals extends StatefulWidget {
  const Hospitals({super.key});

  @override
  State<Hospitals> createState() => _HospitalsState();
}

class _HospitalsState extends State<Hospitals> {
  @override
  void initState() {
    fetchHospitals();
    super.initState();
  }

  final List<String> _services = [
    'Accident and emergency (A&E)',
    'Burns Unit',
    'Cardiology',
    'Coronary Care Unit (CCU)',
    'Critical Care/Intensive Care Unit (ICU)',
    'Dentistry',
    'Endoscopy',
    'Elderly Services',
    'Gastroenterology',
    'General Surgery',
    'Gynecology & Obstetrics',
    'Hematology',
    'Internal Medicine',
    'Maternity',
    'Microbiology',
    'Neonatal',
    'Nephrology',
    'Neurology',
    'Nutrition and Dietetics',
    'Occupational Therapy (OT)',
    'Oncology',
    'Ophthalmology',
    'Orthopedics',
    'Otolaryngology (Ear_Nose_Throat)',
    'Paediatrics',
    'Pharmacy',
    'Physiotherapy',
    'Psychiatry',
    'Radiology',
    'Radiotherapy',
    'Renal',
    'Rheumatology',
    'Urology'
  ];

  List<HospitalModel> hospitals = [];

  void search(String searchQuery) {
    log('searchQuery: $searchQuery');
    List<HospitalModel> searchResult = [];

    hospitalBloc.hospitalController.add([]);

    if (searchQuery.isEmpty) {
      hospitalBloc.hospitalController.sink.add(hospitals);
      return;
    }
    for (var hospital in hospitals) {
      if (hospital.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          hospital.country.toLowerCase().contains(searchQuery.toLowerCase()) ||
          hospital.services
              .toLowerCase()
              .split(',')
              .contains(searchQuery.toLowerCase())) {
        searchResult.add(hospital);
      }
    }
    hospitalBloc.hospitalController.sink.add(searchResult);
  }

  Future<void> fetchHospitals() async {
    Response response = await get(Uri.parse(ApiConstants.baseUrl));
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      ResponseModel responseData =
          ResponseModel.fromJson(jsonDecode(response.body));
      hospitals = responseData.hospitals;
      hospitalBloc.hospitalController.sink.add(hospitals);
    } else {
      throw Exception(response.body.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Container(
                alignment: AlignmentDirectional.centerEnd,
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                  left: MediaQuery.of(context).size.height * 0.015,
                  right: MediaQuery.of(context).size.width * 0.03,
                ),
                height: 250,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/hospitals.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: TextField(
                  onChanged: (text) => search(text),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white70,
                    hintText: 'Search by name or country',
                    hintStyle: TextStyle(
                      color: Colors.red.shade700,
                      fontWeight: FontWeight.w900,
                    ),
                    suffixIcon: Icon(
                      CupertinoIcons.search_circle_fill,
                      color: Colors.red.shade700,
                      size: 50,
                      weight: 3,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                alignment: AlignmentDirectional.centerStart,
                margin: const EdgeInsets.only(left: 10),
                child: Text(
                  'Search by service',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: ColorUtil.fromHex('#0071F2'),
                      fontSize: 17,
                      decoration: TextDecoration.none,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    Expanded(
                      child: ListView.builder(
                          itemCount: _services.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: ElevatedButton(
                                  onPressed: () {
                                    search(_services[index]);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        ColorUtil.fromHex('#C92C6D')
                                            .withOpacity(0.65),
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 30,
                                      vertical: 0,
                                    ),
                                  ),
                                  child: Text(
                                    _services[index],
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ));
                          }),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
              Expanded(
                  child: hospitalWidget(
                      stream: hospitalBloc.hospitalController.stream))
            ],
          ),
        ),
      ),
    );
  }
}
