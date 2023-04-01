import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospitals_app/screens/service_list.dart';
import 'package:hospitals_app/utils/color_from_hex.dart';

import 'hospital_list.dart';

class Hospitals extends StatefulWidget {
  const Hospitals({super.key});

  @override
  State<Hospitals> createState() => _HospitalsState();
}

class _HospitalsState extends State<Hospitals> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
                // margin: const EdgeInsets.only(bottom: 20),
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
                )),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  Container(
                    alignment: AlignmentDirectional.centerStart,
                    margin: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Filter by service <optional>',
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
                  const ServiceList()
                ],
              ),
            ),
            // const SizedBox(height: 10),
            const HospitalList()
          ],
        ),
      )
    );
  }
}
