part of 'university_bloc.dart';

@immutable
abstract class UniversityEvent {}

class FetchCountryUniversities extends UniversityEvent {
  final String country;
  FetchCountryUniversities({required this.country});
}
