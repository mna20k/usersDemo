import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:usersdetails/api/users_api.dart';

import '../models/users_model.dart';

part 'users_event.dart';

part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UsersApi usersApi;

  UsersBloc({required this.usersApi}) : super(LoadingState()) {
    on<UsersEvent>((event, emit) async {
      if (event is GetAllUsersEvent) {
        emit(LoadingState());
        try {
          final users = await usersApi.getAllUsers();
          emit(LoadedState(users));
        } catch (e) {
          emit(const ErrorState(
              'Something went wrong,\nplease try again later!'));
        }
      }
    });
  }
}
