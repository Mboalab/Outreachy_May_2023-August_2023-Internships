import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospitals_app/repository/hospital_repository.dart';
import '../../models/hospital_model.dart';
import 'package:meta/meta.dart';

part 'hospital_event.dart';
part 'hospital_state.dart';

class HospitalBloc extends Bloc<HospitalEvent, HospitalState> {
  final HospitalRepository _hospitalRepository;
  HospitalBloc(this._hospitalRepository) :super(HospitalLoadingState()) {
    on<LoadHospitalEvent>((event, emit) async {
      emit(HospitalLoadingState());
      try {
        final hospitals = await _hospitalRepository.getHospitals();
        emit(HospitalLoadedState(hospitals));
      } catch (e) {
        emit(HospitalErrorState(e.toString()));
      }
    });
  }
}
