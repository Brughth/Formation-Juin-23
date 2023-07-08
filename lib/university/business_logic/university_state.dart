part of 'university_bloc.dart';

@immutable
abstract class UniversityState {
  final List<UniversityModel>? universities;
  const UniversityState({this.universities});
}

class UniversityInitial extends UniversityState {}

class FetchCountryUniversitiesLoading extends UniversityState {
  const FetchCountryUniversitiesLoading({super.universities});
}

class FetchCountryUniversitiesSuccess extends UniversityState {
  const FetchCountryUniversitiesSuccess({super.universities});
}

class FetchCountryUniversitiesFailure extends UniversityState {
  const FetchCountryUniversitiesFailure({super.universities});
}
