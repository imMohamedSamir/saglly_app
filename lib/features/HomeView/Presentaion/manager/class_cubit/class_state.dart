part of 'class_cubit.dart';

@immutable
sealed class ClassState {}

final class ClassInitial extends ClassState {}

final class ClassLoading extends ClassState {}

final class ClassSuccess extends ClassState {
  final List<ClassModel> classes;

  ClassSuccess({required this.classes});
}

final class ClassFailure extends ClassState {}
