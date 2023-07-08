import 'package:flutter/material.dart';
import 'package:formation_juin_23/university/presentation/screens/universities_list_screen.dart';

class SearchUniversityScreen extends StatefulWidget {
  const SearchUniversityScreen({super.key});

  @override
  State<SearchUniversityScreen> createState() => _SearchUniversityScreenState();
}

class _SearchUniversityScreenState extends State<SearchUniversityScreen> {
  late TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        TextFormField(
          controller: _searchController,
          onFieldSubmitted: (value) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => UniversitiesListScreen(
                  country: value,
                ),
              ),
            );
          },
        )
      ]),
    );
  }
}
