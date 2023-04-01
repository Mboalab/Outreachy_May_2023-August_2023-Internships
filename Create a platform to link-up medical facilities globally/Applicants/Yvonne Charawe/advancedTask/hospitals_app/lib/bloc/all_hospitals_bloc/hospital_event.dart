part of 'hospital_bloc.dart';

@immutable
abstract class HospitalEvent extends Equatable {
  const HospitalEvent();
}

class LoadHospitalEvent extends HospitalEvent {
  @override
  List<Object> get props => [];
}
