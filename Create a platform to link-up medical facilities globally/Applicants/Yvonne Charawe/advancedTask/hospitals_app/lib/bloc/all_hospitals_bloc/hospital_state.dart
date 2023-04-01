part of 'hospital_bloc.dart';

@immutable
abstract class HospitalState extends Equatable {}

class HospitalLoadingState extends HospitalState {
  @override
  List<Object?> get props => [];
}

class HospitalLoadedState extends HospitalState {
  final List<HospitalModel> hospitals;

  HospitalLoadedState(this.hospitals);

  @override
  List<Object?> get props => [hospitals];
}

class HospitalErrorState extends HospitalState {
  final String error;

  HospitalErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
