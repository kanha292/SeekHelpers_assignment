import 'package:flutter/material.dart';
import '../models/user.dart';

class UserDetailPage extends StatelessWidget {
  final User user;

  const UserDetailPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
        centerTitle: true,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.indigo,
                  child: Text(
                    user.name[0].toUpperCase(),
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),

                /// Name
                ListTile(
                  leading: Image.asset(
                    'assets/icons/user.png',
                    width: 24,
                    height: 24,
                  ),
                  title: Text("Name"),
                  subtitle: Text(user.name),
                ),
                Divider(),

                /// Email
                ListTile(
                  leading: Image.asset(
                    'assets/icons/mail.png',
                    width: 24,
                    height: 24,
                  ),
                  title: Text("Email"),
                  subtitle: Text(user.email),
                ),
                Divider(),

                /// Phone
                ListTile(
                  leading: Image.asset(
                    'assets/icons/call.png',
                    width: 24,
                    height: 24,
                  ),
                  title: Text("Phone"),
                  subtitle: Text(user.phone),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
