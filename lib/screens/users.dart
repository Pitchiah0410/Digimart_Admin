import 'package:chownow/controller/get/userslist.dart';
import 'package:chownow/model/usermodel.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Users List'),
          bottom: TabBar(tabs: [
            Tab(
              text: 'Active Users',
            ),
            Tab(
              text: 'Inactive Users',
            ),
          ]),
        ),
        body: TabBarView(
          children: [Users(tye: '1'), Users(tye: '0')],
        ),
      ),
    );
  }
}

class Users extends StatefulWidget {
  final tye;
  Users({required this.tye});

  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserListModel>(
        future: UserController.getorderlist(status: widget.tye),
        builder: (context, snapshot) {
          double cardWidth = MediaQuery.of(context).size.width / 3.3;
          double cardHeight = MediaQuery.of(context).size.height / 3.6;
          return !snapshot.hasData
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : GridView.builder(
                  itemCount: snapshot.data!.data!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: MediaQuery.of(context).size.width > 700
                          ? cardWidth / cardHeight
                          : cardHeight / cardWidth,
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 700 ? 3 : 1),
                  itemBuilder: (context, index) {
                    var data = snapshot.data!.data![index];
                    return Card(
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            '${data.firstName!} ${data.lastName!} (User ID : ${data.customerId})',
                          ),
                        ),
                        isThreeLine: true,
                        subtitle: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                    text: 'Address : ',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.bold,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: data.addressDetails == null
                                            ? 'No Address found'
                                            : '${data.addressDetails!.addressLine1}, ${data.addressDetails!.city}, ${data.addressDetails!.state}, ${data.addressDetails!.country}, ${data.addressDetails!.pincode}',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ]),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(data.email!.isEmpty
                                  ? 'Email ID not Found'
                                  : data.email!),
                              SizedBox(
                                height: 7,
                              ),
                              Text(data.mobile!.isEmpty
                                  ? 'Mobile number not found'
                                  : data.mobile!),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
        });
  }
}
