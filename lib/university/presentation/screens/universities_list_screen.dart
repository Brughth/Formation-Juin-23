import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formation_juin_23/university/business_logic/university_bloc.dart';
import 'package:formation_juin_23/university/data/repositories/university_repository.dart';

class UniversitiesListScreen extends StatefulWidget {
  final String country;
  const UniversitiesListScreen({
    super.key,
    required this.country,
  });

  @override
  State<UniversitiesListScreen> createState() => _UniversitiesListScreenState();
}

class _UniversitiesListScreenState extends State<UniversitiesListScreen> {
  late UniversityBloc _universityBloc;
  late UniversityRepository _universityRepository;
  @override
  void initState() {
    _universityRepository = UniversityRepository(dio: Dio());
    // instantier le bloc UniversityBloc
    _universityBloc =
        UniversityBloc(universityRepository: _universityRepository);
    // lancer l'evenement FetchCountryUniversities
    loadUniversities();
    super.initState();
  }

  loadUniversities() {
    _universityBloc.add(FetchCountryUniversities(country: widget.country));
  }

  @override
  Widget build(BuildContext context) {
    // gerer l'etat de lapplication en fonction de l/etat du bloc
    return Scaffold(
      appBar: AppBar(
        title: Text("Universities in ${widget.country}"),
      ),
      body: BlocBuilder<UniversityBloc, UniversityState>(
        bloc: _universityBloc,
        builder: (context, state) {
          if (state is FetchCountryUniversitiesFailure) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "une erreur s'est produite",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      loadUniversities();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.green,
                      ),
                      child: const Text(
                        "Reessayer",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is FetchCountryUniversitiesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is FetchCountryUniversitiesSuccess) {
            var universities = state.universities!;
            return RefreshIndicator(
              onRefresh: () {
                loadUniversities();
                return Future.value();
              },
              child: ListView.builder(
                itemCount: universities.length,
                itemBuilder: (context, index) {
                  var item = universities[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: item.domains.isNotEmpty
                        ? Text.rich(
                            TextSpan(
                              text: item.domains.first,
                              style: const TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.blue,
                              ),
                              children: [],
                            ),
                          )
                        : null,
                  );
                },
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
