import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospitals_app/utils/color_from_hex.dart';

class ServiceList extends StatefulWidget {
  const ServiceList({super.key});

  @override
  State<ServiceList> createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  int count = 0;
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
  @override
  Widget build(BuildContext context) {
    return Container(
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
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          count++;
                          if(count % 2 == 0) {
                            setState(() {
                              // _services[index]
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              ColorUtil.fromHex('#C92C6D').withOpacity(0.65),
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
                      )
                    );
                  }),
            ),
            const SizedBox(height: 15),
          ],
        ));
  }
}
