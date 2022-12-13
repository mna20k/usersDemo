part of 'users_cubit.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class LoadingState extends UsersState {}

class LoadedState extends UsersState {
  final List<Users> users;

  const LoadedState(this.users);

  @override
  List<Object> get props => [users];
}

class ErrorState extends UsersState {
  final String message;

  const ErrorState(this.message);

  @override
  List<Object> get props => [message];
}
