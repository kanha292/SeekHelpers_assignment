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
  final _usernameController = TextEditingController();
  final _addressController = TextEditingController();
  final _companyController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final existingUsers = userProvider.users;

      final emailExists = existingUsers.any(
            (u) => u.email.trim().toLowerCase() == _emailController.text.trim().toLowerCase(),
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
        username: _usernameController.text,
        address: _addressController.text,
        company: _companyController.text,
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

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required String iconPath,
    required String validationMessage,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          prefixIcon: Padding(
            padding: EdgeInsets.all(12),
            child: Image.asset(iconPath, width: 24),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: Colors.white,
        ),
        validator: (value) => value!.isEmpty ? validationMessage : null,
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
              _buildField(
                controller: _nameController,
                label: 'Name',
                hint: 'Enter name',
                iconPath: 'assets/icons/user.png',
                validationMessage: 'Name cannot be empty',
              ),
              _buildField(
                controller: _usernameController,
                label: 'Username',
                hint: 'Enter username',
                iconPath: 'assets/icons/user.png',
                validationMessage: 'Username cannot be empty',
              ),
              _buildField(
                controller: _emailController,
                label: 'Email',
                hint: 'Enter email',
                iconPath: 'assets/icons/mail.png',
                validationMessage: 'Email cannot be empty',
              ),
              _buildField(
                controller: _phoneController,
                label: 'Phone',
                hint: 'Enter phone number',
                iconPath: 'assets/icons/call.png',
                validationMessage: 'Phone number required',
                keyboardType: TextInputType.phone,
              ),
              _buildField(
                controller: _addressController,
                label: 'Address',
                hint: 'Enter address',
                iconPath: 'assets/icons/location.png',
                validationMessage: 'Address cannot be empty',
              ),
              _buildField(
                controller: _companyController,
                label: 'Company',
                hint: 'Enter company name',
                iconPath: 'assets/icons/company.png',
                validationMessage: 'Company name cannot be empty',
              ),
              SizedBox(height: 24),
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
