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
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
