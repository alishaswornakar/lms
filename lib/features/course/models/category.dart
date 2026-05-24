class CourseCategory {
  final String id;
  final String name;
  CourseCategory({required this.id, required this.name});

  factory CourseCategory.fromMap(Map<String, dynamic> map) {
    return CourseCategory(id: map['id'], name: map['name']);
  }
}
