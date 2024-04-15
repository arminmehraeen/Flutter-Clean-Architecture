part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent {}

class LoadCategory extends CategoryEvent {}

class InsertCategory extends CategoryEvent {
  final String title ;
  InsertCategory({
    required this.title,
  });
}

class UpdateCategory extends CategoryEvent {

  final String title ;
  final CategoryEntity categoryEntity ;

  UpdateCategory({
    required this.categoryEntity,
    required this.title
  });
}

class DeleteCategory extends CategoryEvent {

  final CategoryEntity categoryEntity ;

  DeleteCategory({
    required this.categoryEntity,
  });
}

