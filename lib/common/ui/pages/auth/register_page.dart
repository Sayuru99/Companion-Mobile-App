// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names, avoid_print, body_might_complete_normally_nullable, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  _RegisterPageState() {
    Country = Countries[0];
  }

  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;
  final repassController = TextEditingController();
  bool repassToggle = true;

  bool isChecked = false;

  void printMessage() {
    print('user accepted the agreement');
  }

  final Countries = [
    'Sri Lanka',
    'Australia',
    'United Kingdom',
    'United States'
  ];
  String? Country = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(87, 100, 241, 1.0),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Center(
                      child: Text(
                    "Welcome,",
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
                      "Glad To See You!",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Raleway',
                          fontSize: 32),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 0),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(245, 245, 245, 0.9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
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
                        ),

                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                  keyboardType: TextInputType.name,
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    labelText: 'Last Name',
                                    labelStyle: const TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Raleway',
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(11)),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Enter Your First Name";
                                    }
                                  }),
                            ),
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: TextFormField(
                                  keyboardType: TextInputType.name,
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    labelText: 'Last Name',
                                    labelStyle: const TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Raleway',
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(11)),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Enter Your Last Name";
                                    }
                                  }),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 30,
                        ),
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
                                    borderRadius: BorderRadius.circular(11))),
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

                        const SizedBox(
                          height: 30,
                        ),

                        //-->Password text field
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: repassController,
                          obscureText: repassToggle,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 15),
                              labelText: "Retype Password",
                              labelStyle: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'Raleway',
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11)),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    repassToggle = !repassToggle;
                                  });
                                },
                                child: Icon(repassToggle
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter  Retype Password";
                            } else if (repassController.text.length < 6) {
                              return "Password length should be more than 6 characters";
                            }
                          },
                        ),

                        const SizedBox(
                          height: 30,
                        ),

                        DropdownButtonFormField(
                          value: Country,
                          validator: (value) {
                            if (value == null) {
                              return 'Please select your country';
                            }
                            return null;
                          },
                          items: Countries.map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              )).toList(),
                          onChanged: (val) {
                            setState(() {
                              Country = val as String;
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 15),
                            labelText: "Select Country",
                            labelStyle: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'Raleway',
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11)),
                          ),
                        ),

                        //--terms and conditions checkbox field--
                        Container(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                      value: isChecked,
                                      onChanged: (value) {
                                        setState(() {
                                          isChecked = value!;
                                        });
                                      }),
                                  const Text(
                                    'I have read the agreement',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Raleway',
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )),

                        const SizedBox(
                          height: 10,
                        ),

                        InkWell(
                          onTap: () {
                            if (_formfield.currentState!.validate()) {
                              emailController.clear();
                              passController.clear();
                            }
                          },
                          child: Container(
                              height: 50,
                              width: 300,
                              child: Material(
                                borderRadius: BorderRadius.circular(11),
                                color: const Color.fromRGBO(87, 100, 241, 1.0),
                                elevation: 7.0,
                                child: const Center(
                                  child: Text(
                                    "Register",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        const Center(
                            child: Text(
                          "- Sign Up Using -",
                          style: TextStyle(
                            color: Colors.black26,
                            fontSize: 18,
                            fontFamily: 'Raleway',
                          ),
                        )),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                'icons/google.png',
                                height: 40,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                'icons/facebook.png',
                                height: 40,
                              ),
                            ),
                          ],
                        ),

                        const Text(
                          "Already Have An Account?",
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
                                  builder: (context) => LoginPage()),
                            );
                          },
                          child: const Text('Sign In',
                              style: TextStyle(
                                  color: Color.fromRGBO(87, 100, 241, 1.0),
                                  fontSize: 16,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
