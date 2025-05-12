import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodory/core/utlis/ToastificationMethod.dart';
import 'package:hodory/features/HomeView/data/models/class_model.dart';
import 'package:hodory/features/HomeView/data/repo/classes_repo.dart';
import 'package:hodory/main.dart';
import 'package:meta/meta.dart';

part 'class_state.dart';

class ClassCubit extends Cubit<ClassState> {
  ClassCubit(this._repo) : super(ClassInitial());
  final ClassesRepo _repo;
  static ClassCubit get(context) => BlocProvider.of(context);
  //===========================================//
  ClassModel model = ClassModel();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void getClasses({String? name}) async {
    emit(ClassLoading());
    final result = await _repo.getClasses(name: name);
    result.fold((l) => emit(ClassFailure()), (classes) {
      emit(ClassSuccess(classes: classes));
    });
  }

  void addClass() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      emit(ClassLoading());
      final result = await _repo.addClass(model: model);
      result.fold(
        (l) => CustomToastification.errorDialog(content: "there was an error!"),
        (classes) {
          Navigator.pop(navigatorKey.currentContext!);
        },
      );
    }
  }
}
