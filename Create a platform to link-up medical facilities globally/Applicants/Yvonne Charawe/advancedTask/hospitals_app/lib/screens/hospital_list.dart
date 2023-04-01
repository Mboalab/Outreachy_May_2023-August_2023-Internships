import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospitals_app/bloc/all_hospitals_bloc/hospital_bloc.dart';
import 'package:hospitals_app/repository/hospital_repository.dart';

import '../widgets/hospital_bloc_body.dart';

class HospitalList extends StatelessWidget {
  const HospitalList({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HospitalBloc>(
          create: (BuildContext context) => HospitalBloc(HospitalRepository()),
        )
      ],
      child: Material(
        child: SizedBox(
          width: 380,
          height: 350,
          child: hospitalBlocBody(),
        ),
      )
    );
  }
}