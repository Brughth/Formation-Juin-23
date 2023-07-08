import 'package:bloc/bloc.dart';
import 'package:formation_juin_23/university/data/repositories/university_repository.dart';
import 'package:meta/meta.dart';

import '../../data/models/university_model.dart';

part 'university_event.dart';
part 'university_state.dart';

class UniversityBloc extends Bloc<UniversityEvent, UniversityState> {
  final UniversityRepository universityRepository;
  UniversityBloc({
    required this.universityRepository,
  }) : super(UniversityInitial()) {
    on<FetchCountryUniversities>((event, emit) async {
      try {
        emit(
          FetchCountryUniversitiesLoading(
            universities: state.universities,
          ),
        );
        var response = await universityRepository.fetchUniversities(
          country: event.country,
        );
        emit(FetchCountryUniversitiesSuccess(universities: response));
      } catch (e) {
        emit(
          FetchCountryUniversitiesFailure(
            universities: state.universities,
          ),
        );
      }
    });
  }
}
