import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../screens/user_detail_page.dart';
import '../screens/add_user_form.dart';
import '../models/user.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  String searchQuery = '';
  String sortOption = 'Name';

  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).loadUsers().then((_) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Row(
          children: [
            Image.asset('assets/icons/user.png', width: 24, height: 24),
            SizedBox(width: 8),
            Text('User List'),
          ],
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AddUserForm()),
              );
            },
            icon: Image.asset('assets/icons/adduser.png', width: 20, height: 20),
            label: Text(
              'Add User',
              style: TextStyle(color: Colors.black87),
            ),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
          )
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Consumer<UserProvider>(
        builder: (context, userProvider, _) {
          List<User> users = userProvider.users;

          // 🔍 Filter
          List<User> filteredUsers = users
              .where((u) => u.name.toLowerCase().contains(searchQuery))
              .toList();

          // 🔄 Sort
          if (sortOption == 'Name') {
            filteredUsers.sort((a, b) => a.name.compareTo(b.name));
          } else if (sortOption == 'Email') {
            filteredUsers.sort((a, b) => a.email.compareTo(b.email));
          }

          return Column(
            children: [
              // 🔍 Search box
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Search by name',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value.toLowerCase();
                    });
                  },
                ),
              ),

              // 🔄 Sort dropdown with sort.png icon
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Image.asset('assets/icons/az.png',
                        width: 20, height: 20),
                    SizedBox(width: 6),
                    Text('Sort by:',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    SizedBox(width: 10),
                    DropdownButton<String>(
                      value: sortOption,
                      items: ['Name', 'Email'].map((option) {
                        return DropdownMenuItem(
                          value: option,
                          child: Text(option),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          sortOption = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),

              // 📋 User List
              Expanded(
                child: filteredUsers.isEmpty
                    ? Center(child: Text("No users found."))
                    : ListView.builder(
                  itemCount: filteredUsers.length,
                  padding:
                  EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  itemBuilder: (context, index) {
                    final user = filteredUsers[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 6),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(12),
                        leading: CircleAvatar(
                          backgroundColor: Colors.indigo,
                          child: Text(
                            user.name[0].toUpperCase(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text(user.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold)),
                        subtitle: Text(user.email),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  UserDetailPage(user: user),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
