// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadFilePage extends StatefulWidget {
  const UploadFilePage({Key? key}) : super(key: key);

  @override
  _UploadFilePageState createState() => _UploadFilePageState();
}

class _UploadFilePageState extends State<UploadFilePage> {
  final List<String> _files = [];

  void _selectFiles() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.any);
    if (result != null) {
      setState(() {
        _files.add(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_outlined),
            onPressed: () {},
          ),
        ],
        elevation: 0,
        backgroundColor: const Color.fromRGBO(88, 101, 242, 1.0),
        title: const Text(
          'Companion',
          style: TextStyle(fontFamily: 'Roboto'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color.fromRGBO(88, 101, 242, 1.0),
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Upload',
                        style: TextStyle(
                          color: Color.fromRGBO(88, 101, 242, 1.0),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GestureDetector(
                onTap: _selectFiles,
                child: SizedBox(
                  height: 200,
                  child: DottedBorder(
                    dashPattern: const [4],
                    strokeWidth: 2,
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Upload your legal ',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 26,
                              ),
                            ),
                            Text(
                              'document here',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 26,
                              ),
                            ),
                            SizedBox(height: 16),
                            Icon(
                              Icons.folder_copy,
                              color: Color.fromRGBO(88, 101, 242, 1.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const PointedTextList(
              items: [
                'Laboris voluptate ipsum culpa et veniam nulla fugiat ex Lorem.',
                'Dolor voluptate magna ea laboris dolor adipisicing et.',
                'Ut laborum eiusmod in ullamco sint voluptate anim exercitation deserunt.',
                'Consequat in ad consectetur ad fugiat quis.',
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  //
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(88, 101, 242, 1.0),
                ),
                child: const Text('Send'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// instructions widget
class PointedTextList extends StatelessWidget {
  final List<String> items;

  const PointedTextList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: items
            .map((item) => ListTile(
                  title: Text(
                    item,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  contentPadding: const EdgeInsets.only(left: 4.0),
                ))
            .toList(),
      ),
    );
  }
}
