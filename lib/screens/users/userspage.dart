import 'package:digimartadmin/constants/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        // height: 350,
        child: Card(
          color: secondaryColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Users', style: Theme.of(context).textTheme.title),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: userController.users.length,
                    itemBuilder: (context, index) {
                      return Card(
                          color: bgColor,
                          child: ListTile(
                            trailing: Text(userController.users[index].address),
                            title: Text(userController.users[index].name),
                            subtitle: Text(userController.users[index].phone,
                                style: Theme.of(context).textTheme.overline),
                          ));
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
