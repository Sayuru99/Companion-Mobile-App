import 'package:flutter/material.dart';
import 'login.dart';

class ForgotPswPage extends StatefulWidget {
  @override
  _ForgotPswPageState createState() => _ForgotPswPageState();
}

class _ForgotPswPageState extends State<ForgotPswPage> {
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final numController = TextEditingController();
  bool passToggle = true;

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
                    "Let's Reset",
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
                      "The Password",
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
                                        borderRadius:
                                            BorderRadius.circular(11))),
                                validator: (value) {
                                  bool emailValid = RegExp(
                                          r"^[zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_'{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value!);

                                  if (value!.isEmpty) {
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
                                keyboardType: TextInputType.number,
                                controller: numController,
                                decoration: InputDecoration(
                                    labelText: "Code",
                                    labelStyle: const TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Raleway',
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(11))),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter the Code";
                                  }
                                }),

                            //-->Sign in btn
                            const SizedBox(
                              height: 40,
                            ),
                            InkWell(
                              onTap: () {
                                if (_formfield.currentState!.validate()) {
                                  emailController.clear();
                                  numController.clear();
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
                                        "Reset Password",
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
                              height: 40,
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
                              child: const Text('Login',
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
