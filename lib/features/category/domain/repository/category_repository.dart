import '../../../../core/resources/data_state.dart';
import '../entities/category_entity.dart';

abstract class CategoryRepository<T> {

  Future<DataState<List<T>>> index() ;
  Future<DataState<bool>> insert(T entity) ;
  Future<DataState<bool>> update(T entity) ;
  Future<DataState<bool>> delete(T entity) ;

}
