import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class UploadPopupPage extends StatefulWidget {
  const UploadPopupPage({super.key});

  @override
  _UploadPopupPageState createState() => _UploadPopupPageState();
}

class _UploadPopupPageState extends State<UploadPopupPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        content: Container(
          width: 300.0,
          height: 500,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
            child: Container(
              width: 380.0,
              height: 600,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Center(
                      child: Text("Document Upload",
                          style: TextStyle(
                              color: Color.fromRGBO(87, 100, 241, 1.0),
                              fontSize: 20.0,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w900)),
                    ),
                    const Text("Succeeded",
                        style: TextStyle(
                            color: Color.fromRGBO(87, 100, 241, 1.0),
                            fontSize: 20.0,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w900)),
                    const SizedBox(height: 40),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.black12, width: 6),
                      ),
                      child: const Icon(
                        Icons.check,
                        size: 50,
                        color: Color.fromRGBO(87, 100, 241, 1.0),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    const Center(
                      child: Text(
                          "Lorem ipsum dolor sit amet, consectetur, adipiscing elit, sed do eiusmod",
                          style: TextStyle(
                              color: Color.fromRGBO(87, 100, 241, 1.0),
                              fontSize: 14.0)),
                    ),
                    const SizedBox(height: 60.0),
                    const Text("Donation Legal",
                        style: TextStyle(
                            color: Color.fromRGBO(87, 100, 241, 1.0),
                            fontSize: 20.0,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w900)),
                    const Text("Documents",
                        style: TextStyle(
                            color: Color.fromRGBO(87, 100, 241, 1.0),
                            fontSize: 20.0,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w900)),
                    const SizedBox(height: 40.0),
                    InkWell(
                      onTap: () {},
                      child: SizedBox(
                          height: 50,
                          width: 300,
                          child: Material(
                            borderRadius: BorderRadius.circular(11),
                            color: const Color.fromRGBO(87, 100, 241, 1.0),
                            elevation: 5.0,
                            child: const Center(
                              child: Text(
                                "Back To Home",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                    ),
                    const SizedBox(height: 20.0),
                    InkWell(
                      onTap: () {},
                      child: const Text('Resubmit',
                          style: TextStyle(
                              color: Color.fromRGBO(255, 0, 0, 1.0),
                              fontSize: 18,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
