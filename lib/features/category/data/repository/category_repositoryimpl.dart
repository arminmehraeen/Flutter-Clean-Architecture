import 'dart:convert';
import '../../../../core/resources/data_state.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/repository/category_repository.dart';
import '../data_source/category_local_provider.dart';


class CategoryRepositoryImpl<T> extends CategoryRepository<CategoryEntity> {

  final CategoryLocalProvider   local;

  CategoryRepositoryImpl(this.local);

  @override
  Future<DataState<List<CategoryEntity>>> index() async {
    try {
      List<String> data = local.read();
      List<CategoryEntity> categories = data.map((e) => CategoryEntity.fromMap(json.decode(e))).toList() ;
      return DataSuccess(data:  categories);
    }catch(e) {
      return DataFailed(error: e.toString()) ;
    }
  }

  @override
  Future<DataState<bool>> insert(CategoryEntity entity) async {
    try {
      List<String> data = local.read();
      List<CategoryEntity> categories = data.map((e) => CategoryEntity.fromMap(json.decode(e))).toList()..add(entity) ;
      List<String> temp = categories.map((e) => json.encode(e.toMap())).toList();
      return DataSuccess(data: await local.write(temp));
    }catch(e) {
      return DataFailed(error: e.toString()) ;
    }
  }

  @override
  Future<DataState<bool>> update(CategoryEntity entity) async {
    try {
      List<String> data = local.read();
      List<CategoryEntity> categories = data.map((e) => CategoryEntity.fromMap(json.decode(e))).toList().map((e) => e.id == entity.id ? entity : e).toList() ;
      List<String> temp = categories.map((e) => json.encode(e.toMap())).toList();
      return DataSuccess(data: await local.write(temp));
    }catch(e) {
      return DataFailed(error: e.toString()) ;
    }
  }

  @override
  Future<DataState<bool>> delete(CategoryEntity entity) async {
    try {
      List<String> data = local.read();
      List<CategoryEntity> categories = data.map((e) => CategoryEntity.fromMap(json.decode(e))).toList();
      List item = categories.where((element) => element.id != entity.id).toList() ;
      List<String> temp = item.map((e) => json.encode(e.toMap())).toList();
      return DataSuccess(data: await local.write(temp));
    }catch(e) {
      return DataFailed(error: e.toString()) ;
    }
  }

}
