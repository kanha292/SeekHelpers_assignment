import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/user_provider.dart';

class AddUserForm extends StatefulWidget {
  @override
  State<AddUserForm> createState() => _AddUserFormState();
}

class _AddUserFormState extends State<AddUserForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final existingUsers = userProvider.users;

      final emailExists = existingUsers.any(
            (u) => u.email.trim().toLowerCase() ==
            _emailController.text.trim().toLowerCase(),
      );

      final phoneExists = existingUsers.any(
            (u) => u.phone.trim() == _phoneController.text.trim(),
      );

      if (emailExists) {
        _showError('User already exists with this email');
        return;
      }

      if (phoneExists) {
        _showError('User already exists with this phone number');
        return;
      }

      final newUser = User(
        id: DateTime.now().millisecondsSinceEpoch,
        name: _nameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
      );

      userProvider.addUser(newUser);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User added successfully'),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pop(context);
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New User'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Name Field
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Enter name',
                  labelText: 'Name',
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(12),
                    child: Image.asset('assets/icons/user.png', width: 24),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) =>
                value!.isEmpty ? 'Name cannot be empty' : null,
              ),
              SizedBox(height: 16),

              // Email Field
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Enter email',
                  labelText: 'Email',
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(12),
                    child: Image.asset('assets/icons/mail.png', width: 24),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) =>
                value!.isEmpty ? 'Email cannot be empty' : null,
              ),
              SizedBox(height: 16),

              // Phone Field
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Enter phone number',
                  labelText: 'Phone',
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(12),
                    child: Image.asset('assets/icons/call.png', width: 24),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (value) =>
                value!.isEmpty ? 'Phone number required' : null,
              ),
              SizedBox(height: 24),

              // Submit Button
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.indigo,
                ),
                child: Text(
                  'Add User',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
