import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/hospital_details.dart';
import '../utils/color_from_hex.dart';
import 'loading_animation.dart';

Widget hospitalWidget({required Stream stream}) {
  return StreamBuilder(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return Center(child: loadingAnimation());
        }
        return snapshot.connectionState == ConnectionState.waiting
            ? Center(child: loadingAnimation())
            : ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: snapshot.data.length,
                itemBuilder: (_, index) {
                  return Card(
                    elevation: 15,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Colors.black.withOpacity(0.07),
                        width: 1,
                      ),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 7,
                      ),
                      tileColor: ColorUtil.fromHex('#DDEDEE').withOpacity(0.7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      leading: CircleAvatar(
                        backgroundColor:
                            ColorUtil.fromHex('#0071F2').withOpacity(0.3),
                        child: Container(
                          decoration: const BoxDecoration(
                            // color: ColorUtil.fromHex('#0071F2').withOpacity(0.3),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          child: Image.asset(
                            'assets/vector.png',
                            width: 18,
                          ),
                        ),
                      ),
                      title: Text(
                        snapshot.data[index].name,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${snapshot.data[index].region},  ${snapshot.data[index].country.toUpperCase()}",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: ColorUtil.fromHex('#0071F2'),
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                CupertinoIcons.calendar,
                                color: ColorUtil.fromHex('#0071F2'),
                                size: 20,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                snapshot.data[index].operatingHours,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HospitalDetails(
                              hospital: snapshot.data[index],
                            ),
                          ),
                        );
                      }
                    ),
                  );
                },
              );
      });
}
