import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/course/models/category.dart';
import 'package:lms/features/course/repositories/course.dart';


part 'category_event.dart';
part 'category_state.dart';

class GetCategoryBloc extends Bloc<GetCategoryEvent, GetCategoryState> {
  final CourseRepository _repo = CourseRepository();
  GetCategoryBloc() : super(GetCategoryInitial()) {
    on<GetCategoryEvent>((event, emit) async {
      emit(GetCategoryLoading());
      final result = await _repo.getCategories();
      result.fold(
        (l) => emit(GetCategoryFailure(msg: l)),
        (categories) => emit(GetCategoryLoaded(categories: categories)),
      );
    });
  }
}
