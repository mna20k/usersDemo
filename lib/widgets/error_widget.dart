import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usersdetails/bloc/users_bloc.dart';

class MyErrorWidget extends StatelessWidget {
  final String message;

  const MyErrorWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<UsersBloc>(context).add(GetAllUsersEvent());
            },
            child: const Text('Try Again'),
          )
        ],
      ),
    );
  }
}
