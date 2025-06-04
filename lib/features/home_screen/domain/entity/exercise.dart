class Exercise {
  final String id;
  final String name;
  final String description;
  final int duration;
  final String difficulty;
  bool isCompleted;

  Exercise({
    required this.id,
    required this.name,
    required this.description,
    required this.duration,
    required this.difficulty,
    this.isCompleted = false,
  });
}