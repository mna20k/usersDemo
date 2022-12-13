import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/users_api.dart';
import '../cubit/users_cubit.dart';
import '../models/users_model.dart';

class ListWidget extends StatelessWidget {
  final List<Users> users;

  const ListWidget({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onLongPress: () {
              var usersList = users..removeWhere((element) => element.id == users[index].id);
              UsersCubit(usersApi: UsersApi()).updateUsers(usersList);
            },
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(users[index].id.toString()),
            ),
            title: RichText(
              text: TextSpan(
                text: users[index].name,
                children: <TextSpan>[
                  TextSpan(text: ' - ${users[index].name}'),
                ],
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            subtitle: Text(users[index].email),
          ),
        );
      },
    );
  }
}
