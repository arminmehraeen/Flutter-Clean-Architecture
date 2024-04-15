class TodoEntity {

  final String id ;
  final String title ;
  final String description ;
  final bool status ;
  final String category ;

  const TodoEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.category,
  });

  factory TodoEntity.newObject({required String title,required String description,required String category}) {
    return TodoEntity(
      id: DateTime.now().toString(),
      title: title,
      description: description,
      status: true,
      category: category,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'status': status,
      'category': category,
    };
  }



  factory TodoEntity.fromMap(Map<String, dynamic> map) {
    return TodoEntity(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      status: map['status'] as bool,
      category: map['category'] as String,
    );
  }

  TodoEntity copyWith({
    String? id,
    String? title,
    String? description,
    bool? status,
    String? category,
  }) {
    return TodoEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      status: status ?? this.status,
    );
  }
}