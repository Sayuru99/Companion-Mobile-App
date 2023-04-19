// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import '../../../auth/authservice.dart';
import '../../../models/user.dart';
import '../../../routes/routes.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();

  AuthService _authService = AuthService();

  String? _errorMessage;

  void _login() async {
    // Attempt to log in with the given username.
    User? user = await _authService.login(_usernameController.text);

    // If login was successful, navigate to the home page.
    if (user != null) {
      Navigator.pushNamed(context, Routes.home);
    } else {
      setState(() {
        _errorMessage = "Invalid username.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: "Username"),
                controller: _usernameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a username.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _login();
                  }
                },
                child: const Text("Login"),
              ),
              const SizedBox(height: 8.0),
              if (_errorMessage != null)
                Text(
                  _errorMessage!,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
