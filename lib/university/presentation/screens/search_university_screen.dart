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
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _searchController,
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.red,
                border: OutlineInputBorder(),
              ),
              onFieldSubmitted: (value) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => UniversitiesListScreen(
                      country: value,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
