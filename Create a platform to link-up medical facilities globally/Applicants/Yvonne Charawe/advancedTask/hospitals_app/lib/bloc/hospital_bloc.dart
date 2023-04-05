import 'dart:async';

import '../models/hospital_model.dart';
import 'bloc.dart';

class HospitalBloc extends Bloc {

  final hospitalController = StreamController<List<HospitalModel>>.broadcast();
  @override
  void dispose() {}
}

HospitalBloc hospitalBloc = HospitalBloc();
