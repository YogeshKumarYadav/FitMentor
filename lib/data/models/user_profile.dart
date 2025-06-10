class UserProfile {
  final String id;
  final String name;
  final int age;
  final String gender;
  final double height;
  final double weight;
  final List<String> medicalConditions;

  UserProfile({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.height,
    required this.weight,
    required this.medicalConditions,
  });
}
