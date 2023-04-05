import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospitals_app/utils/color_from_hex.dart';
import '../models/hospital_model.dart';

class HospitalDetails extends StatelessWidget {
  final HospitalModel hospital;

  const HospitalDetails({
    super.key,
    required this.hospital,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(CupertinoIcons.arrow_left_circle_fill),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          iconTheme: IconThemeData(
            color: Colors.red.shade700,
            size: 30,
          ),
          title: Text(
            hospital.name,
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
              color: ColorUtil.fromHex('#0071F2'),
              fontSize: 20,
              fontWeight: FontWeight.w800,
            )),
          ),
        ),
        body: Container(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Text(
                    'Services',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: ColorUtil.fromHex('#C92C6D'),
                        fontWeight: FontWeight.w800,
                      )
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 350,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade100,
                        // border: Border.all(
                        //   color: Colors.black.withOpacity(0.1),
                        //   width: 2,
                        // ),
                        borderRadius: BorderRadius.circular(10),
                        // boxShadow: const [
                        //   BoxShadow(
                        //     color: Colors.black26,
                        //     blurRadius: 10,
                        //     spreadRadius: 5,
                        //   ),
                        // ],
                      ),
                      child: ListView(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 16,
                        ),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: hospital.services.split(',').map((service) {
                          return Text(
                            service,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.deepOrange.shade600,
                                fontWeight: FontWeight.w500,
                              )
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.location_solid,
                        color: Colors.green.shade700,
                        size: 20,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "${hospital.region}  -  ${hospital.country}",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          )
                        ),
                    ),
                    ]
                  ),
                  const SizedBox(height: 20),
                  Row(children: [
                    Icon(
                      CupertinoIcons.mail_solid,
                      color: Colors.redAccent.shade700,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      hospital.email,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                  ]),
                  const SizedBox(height: 20),
                  Row(children: [
                    Icon(
                      CupertinoIcons.phone_solid,
                      color: Colors.blueAccent.shade700,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      hospital.phoneNumber,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                  ]),
                  const SizedBox(height: 20),
                  Row(children: [
                    Icon(
                      CupertinoIcons.link_circle_fill,
                      color: Colors.redAccent.shade700,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      hospital.website.split('://')[1],
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 15,
                          overflow: TextOverflow.ellipsis,
                          decoration: TextDecoration.underline,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                      )),
                    ),
                  ]),
                  const SizedBox(height: 10),
                ],
              ),
            )
          )
        );
  }
}
