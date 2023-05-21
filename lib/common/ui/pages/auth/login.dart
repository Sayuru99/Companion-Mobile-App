// ignore_for_file: library_private_types_in_public_api, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../home.dart';
import 'register_page.dart';
import 'forgot_psw.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;
  final repassController = TextEditingController();
  bool repassToggle = true;

  void _login() {
    if (_formfield.currentState!.validate()) {
      // Validate the form fields

      String email = emailController.text.trim();
      String password = passController.text.trim();

      if (email == 'admin@companion.ai' && password == 'Admin@123') {
        // Login successful
        emailController.clear();
        passController.clear();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      } else {
        // Invalid credentials
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Invalid Credentials'),
              content: const Text('Please enter valid credentials.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(87, 100, 241, 1.0),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Center(
                      child: Text(
                    "Hello,",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                  SizedBox(
                    height: 2,
                  ),
                  Center(
                    child: Text(
                      "Welcome Back",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Raleway',
                          fontSize: 32),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(245, 245, 245, 0.9),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Form(
                        key: _formfield,
                        child: Column(
                          children: <Widget>[
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color.fromRGBO(
                                            74, 89, 147, 0.5137254901960784),
                                        blurRadius: 50,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: const <Widget>[],
                              ),
                            ),

                            //-->Name or Email text field
                            TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                decoration: InputDecoration(
                                  labelText: "Email Address",
                                  labelStyle: const TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Raleway',
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(11),
                                  ),
                                ),
                                validator: (value) {
                                  bool emailValid = RegExp(
                                          r"^[zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_'{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value!);

                                  if (value.isEmpty) {
                                    return "Enter Email";
                                  } else if (!emailValid) {
                                    return "Enter Valid Email";
                                  }
                                }),

                            const SizedBox(
                              height: 30,
                            ),

                            //-->Password text field
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: passController,
                              obscureText: passToggle,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 20.0, horizontal: 15),
                                  labelText: "Password",
                                  labelStyle: const TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Raleway',
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(11)),
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        passToggle = !passToggle;
                                      });
                                    },
                                    child: Icon(passToggle
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                  )),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Password";
                                } else if (passController.text.length < 6) {
                                  return "Password length should be more than 6 characters";
                                }
                              },
                            ),

                            //-->Forgot Password text
                            Container(
                              alignment: const Alignment(1.0, 0.0),
                              padding:
                                  const EdgeInsets.only(top: 15.0, left: 20.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPswPage()),
                                  );
                                },
                                child: const Text("Forgot Password?",
                                    style: TextStyle(
                                      color: Color.fromRGBO(87, 100, 241, 1.0),
                                      fontSize: 16,
                                      fontFamily: 'Raleway',
                                    )),
                              ),
                            ),

                            //-->Sign in btn
                            const SizedBox(
                              height: 40,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (_formfield.currentState!.validate()) {
                                  emailController.clear();
                                  passController.clear();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomePage(),
                                    ),
                                  );
                                }
                              },
                              child: SizedBox(
                                height: 50,
                                width: 300,
                                child: Material(
                                  borderRadius: BorderRadius.circular(11),
                                  color:
                                      const Color.fromRGBO(87, 100, 241, 1.0),
                                  elevation: 7.0,
                                  child: const Center(
                                    child: Text(
                                      "Sign In",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Or",
                              style: TextStyle(
                                color: Color.fromRGBO(87, 100, 241, 1.0),
                                fontSize: 20,
                                fontFamily: 'Raleway',
                              ),
                            ),

                            //-->Sign in with google btn
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                                height: 50,
                                width: 300,
                                color: Colors.transparent,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color.fromRGBO(
                                              87, 100, 241, 1.0),
                                          style: BorderStyle.solid,
                                          width: 1.5),
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(11)),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Center(
                                          child: Image.asset(
                                            'icons/google.png',
                                            height: 30,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Center(
                                          child: Text(
                                            "Sign in with Google",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    87, 100, 241, 1.0),
                                                fontSize: 20,
                                                fontFamily: 'Raleway',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ]),
                                )),

                            //-->Sign in with facebook btn
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                                height: 50,
                                width: 300,
                                color: Colors.transparent,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color.fromRGBO(
                                              87, 100, 241, 1.0),
                                          style: BorderStyle.solid,
                                          width: 1.5),
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(11)),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        // Center(
                                        //   child: SvgPicture.asset(
                                        //     'assets/icons/facebook.svg',
                                        //     height: 25,
                                        //   ),
                                        // ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Center(
                                          child: Text(
                                            "Sign in with Facebook",
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    87, 100, 241, 1.0),
                                                fontSize: 20,
                                                fontFamily: 'Raleway',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ]),
                                )),

                            const SizedBox(
                              height: 50,
                            ),
                            const Text(
                              "Don't Have An Account?",
                              style: TextStyle(
                                color: Color.fromRGBO(87, 100, 241, 1.0),
                                fontSize: 16,
                                fontFamily: 'Raleway',
                              ),
                            ),

                            const SizedBox(
                              height: 3,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterPage()),
                                );
                              },
                              child: const Text('Register',
                                  style: TextStyle(
                                      color: Color.fromRGBO(87, 100, 241, 1.0),
                                      fontSize: 16,
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
