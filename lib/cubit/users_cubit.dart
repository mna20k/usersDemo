import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../api/users_api.dart';
import '../models/users_model.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final UsersApi usersApi;

  UsersCubit({required this.usersApi}) : super(LoadingState());

  void getAllUsers() async {
    emit(LoadingState());
    try {
      final users = await usersApi.getAllUsers();
      emit(LoadedState(users));
    } catch (e) {
      emit(const ErrorState('Something went wrong,\nplease try again later!'));
    }
  }

  void deleteUsers(int id) async {
    try {
      final users = await usersApi.getAllUsers();
      print(users);
      final newUsers = users..removeWhere((element) => element.id == id);
      print(newUsers);
      // final newUsers = await usersApi.deleteUsers(ids);
      emit(LoadedState(users));
    } catch (e) {
      rethrow;
    }
  }

  void updateUsers(List<Users> users) async {
    emit(LoadingState());
    try {
      emit(LoadedState(users));
    } catch (e) {
      rethrow;
    }
  }
}
