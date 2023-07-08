import 'package:dio/dio.dart';
import 'package:formation_juin_23/university/data/models/university_model.dart';

class UniversityRepository {
  final Dio dio;
  UniversityRepository({required this.dio});

  Future<List<UniversityModel>> fetchUniversities({
    required String country,
  }) async {
    Map<String, dynamic> queryParameters = {};
    queryParameters['country'] = country;
    final response = await dio.get(
      "http://universities.hipolabs.com/search",
      queryParameters: queryParameters,
    );
    List<UniversityModel> results = [];
    for (var i = 0; i < response.data.length; i++) {
      results.add(UniversityModel.fromJson(response.data[i]));
    }
    return results;
  }
}
