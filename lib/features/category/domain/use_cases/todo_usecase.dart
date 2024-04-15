import 'package:flutter_clean_architecture/features/todo/domain/entities/todo_entity.dart';

import '../../../../core/resources/data_state.dart';
import '../repository/category_repository.dart';

class CategoryUseCase<T>  {

  final CategoryRepository<T> _categoryRepository;
  CategoryUseCase(this._categoryRepository);

  Future<DataState<List<T>>> index() async => await _categoryRepository.index() ;

  Future<DataState<bool>> insert(T entity) async => await _categoryRepository.insert(entity) ;

  Future<DataState<bool>> update(T entity) async => await _categoryRepository.update(entity) ;

  Future<DataState<bool>> delete(T entity) async => await _categoryRepository.delete(entity) ;

}
