class UniversityModel {
  final List<String> webPages;
  final List<String> domains;
  final String country;
  final String name;
  final String? stateProvince;
  final String alphaTwoCode;

  UniversityModel({
    required this.webPages,
    required this.domains,
    required this.country,
    required this.name,
    required this.stateProvince,
    required this.alphaTwoCode,
  });

  factory UniversityModel.fromJson(Map<String, dynamic> json) {
    return UniversityModel(
      webPages: List<String>.from(json['web_pages']),
      domains: List<String>.from(json['domains']),
      country: json['country'],
      name: json['name'],
      stateProvince: json['state-province'],
      alphaTwoCode: json['alpha_two_code'],
    );
  }
}
