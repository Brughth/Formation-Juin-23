import 'package:flutter/material.dart';

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
  @override
  void initState() {
    // instantier le bloc UniversityBloc
    // lancer l'evenement FetchCountryUniversities
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // gerer l'etat de lapplication en fonction de l/etat du bloc
    return Scaffold();
  }
}
