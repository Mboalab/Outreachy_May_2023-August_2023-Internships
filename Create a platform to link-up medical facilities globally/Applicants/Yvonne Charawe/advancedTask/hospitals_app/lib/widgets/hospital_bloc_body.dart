import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospitals_app/models/hospital_model.dart';
import 'package:hospitals_app/utils/color_from_hex.dart';
import 'package:hospitals_app/widgets/loading_animation.dart';

import '../bloc/all_hospitals_bloc/hospital_bloc.dart';
import '../repository/hospital_repository.dart';

Widget hospitalBlocBody() {
  return BlocProvider(
    create: (context) =>
        HospitalBloc(HospitalRepository())..add(LoadHospitalEvent()),
    child: BlocBuilder<HospitalBloc, HospitalState>(
      builder: (context, state) {
        if (state is HospitalLoadingState) {
          return Center(child: loadingAnimation());
        }
        if (state is HospitalLoadedState) {
          List<HospitalModel> hospitals = state.hospitals;
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: hospitals.length,
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
                    vertical: 7,),
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
                    hospitals[index].name,
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
                        "${hospitals[index].region},  ${hospitals[index].country.toUpperCase()}",
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
                            hospitals[index].operatingHours,
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
                ),
              );
            },
          );
        }
        if (state is HospitalErrorState) {
          return const Center(child: Text("Error"));
        }
        return Container();
      },
    ),
  );
}
