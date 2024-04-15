import 'package:bloc/bloc.dart';
import 'package:flutter_clean_architecture/features/category/domain/entities/category_entity.dart';
import 'package:flutter_clean_architecture/features/category/domain/use_cases/todo_usecase.dart';
import 'package:meta/meta.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/model/action_status.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {

  final CategoryUseCase<CategoryEntity> categoryUseCase ;

  CategoryBloc(this.categoryUseCase) : super(CategoryState.init()) {

    on<LoadCategory>((event, emit)  async {
      emit(CategoryState.init()) ;

      DataState<List<CategoryEntity>> response = await categoryUseCase.index() ;

      if(response is DataSuccess) {
        emit(state.copyWith(load: SuccessState<List<CategoryEntity>>(data: response.data!))) ;
      }

      if(response is DataFailed) {
        emit(state.copyWith(load: ErrorState(message: response.error!))) ;
      }

    });

    on<InsertCategory>((event, emit)  async {


      DataState<bool> response = await categoryUseCase.insert(CategoryEntity.newObject(title: event.title)) ;

      if(response is DataSuccess) {
        emit(state.copyWith(insert: SuccessState(data: "کار با موفقیت اضافه شد"))) ;
      }

      if(response is DataFailed) {
        emit(state.copyWith(insert: ErrorState(message: "مشکل در اضافه کردن کار"))) ;
      }

    });

    on<UpdateCategory>((event, emit)  async {

      DataState<bool> response = await categoryUseCase.update(event.categoryEntity.copyWith(
          title: event.title
      )) ;

      if(response is DataSuccess) {
        emit(state.copyWith(update: SuccessState(data: "کار با موفقیت ویرایش شد"))) ;
      }

      if(response is DataFailed) {
        emit(state.copyWith(update: ErrorState(message: "مشکل در ویرایش کردن کار"))) ;
      }

    });


    on<DeleteCategory>((event, emit)  async {

      DataState<bool> response = await categoryUseCase.delete(event.categoryEntity) ;

      if(response is DataSuccess) {
        emit(state.copyWith(delete: SuccessState(data: "کار با موفقیت حذف شد"))) ;
      }

      if(response is DataFailed) {
        emit(state.copyWith(delete: ErrorState(message: "مشکل در حذف کردن کار"))) ;
      }

    });

  }
}
