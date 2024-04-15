class CategoryEntity {

  final String id ;
  final String title ;

  const CategoryEntity({
    required this.id,
    required this.title,
  });

  factory CategoryEntity.newObject({required String title}) {
    return CategoryEntity(
      id: DateTime.now().toString(),
      title: title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title
    };
  }

  factory CategoryEntity.fromMap(Map<String, dynamic> map) {
    return CategoryEntity(
      id: map['id'] as String,
      title: map['title'] as String,
    );
  }

  CategoryEntity copyWith({
    String? id,
    String? title,
  }) {
    return CategoryEntity(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }
}