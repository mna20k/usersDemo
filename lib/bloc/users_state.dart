part of 'users_bloc.dart';

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

class DeleteState extends UsersState {
  final String ids;

  const DeleteState(this.ids);

  @override
  List<Object> get props => [ids];
}
