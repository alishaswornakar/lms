

part of 'category_bloc.dart';

sealed class GetCategoryState extends Equatable {
  const GetCategoryState();

  @override
  List<Object> get props => [];
}

final class GetCategoryInitial extends GetCategoryState {}

final class GetCategoryLoading extends GetCategoryState {}

final class GetCategoryLoaded extends GetCategoryState {
  final List<CourseCategory> categories;

  GetCategoryLoaded({required this.categories});

  @override
  List<Object> get props => [categories];
}

final class GetCategoryFailure extends GetCategoryState {
  final String msg;

  GetCategoryFailure({required this.msg});

  @override
  List<Object> get props => [msg];
}
