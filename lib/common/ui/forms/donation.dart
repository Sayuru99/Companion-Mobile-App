// ignore_for_file: library_private_types_in_public_api, unused_field, sort_child_properties_last

import 'package:companion_app/common/ui/forms/uploadFile.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class CreatePostPage extends StatefulWidget {
  final String companion;

  const CreatePostPage({Key? key, required this.companion}) : super(key: key);

  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  String? _postText;
  final List<String> _photos = [];
  final List<String> _videos = [];
  String? _location;
  bool _raiseFunds = false;

  void _selectPhotos() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _photos.add(pickedFile.path);
      });
    }
  }

  void _selectVideos() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.video);
    if (result != null) {
      setState(() {
        _videos.add(result.files.single.path!);
      });
    }
  }

  void _selectLocation() {
    // TODO: Implement location selection logic
  }

  void _toggleRaiseFunds(bool value) {
    setState(() {
      _raiseFunds = value;
    });
  }

  void _createPost() {
    // TODO: Implement post creation logic
  }

  void _nextAction() {
    if (_raiseFunds) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const UploadFilePage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Done'),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color.fromRGBO(88, 101, 242, 1.0),
        title: const Center(
          child: Text(
            'Companion',
            style: TextStyle(fontFamily: 'Roboto'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      color: Colors.blue,
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Create Post',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            NetworkImage('https://via.placeholder.com/50'),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              _postText = value;
                            });
                          },
                          minLines: 8,
                          maxLines: null,
                          decoration: const InputDecoration(
                            hintText: 'Want to start a charity?',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: _selectPhotos,
                        child: Row(
                          children: const [
                            Icon(
                              Icons.photo,
                              color: Color.fromRGBO(88, 101, 242, 1.0),
                            ),
                            SizedBox(width: 16),
                            Text(
                              'Photos',
                              style: TextStyle(
                                color: Color.fromRGBO(88, 101, 242, 1.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      GestureDetector(
                        onTap: _selectVideos,
                        child: Row(
                          children: const [
                            Icon(
                              Icons.video_collection,
                              color: Color.fromRGBO(88, 101, 242, 1.0),
                            ),
                            SizedBox(width: 16),
                            Text(
                              'Videos',
                              style: TextStyle(
                                color: Color.fromRGBO(88, 101, 242, 1.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      GestureDetector(
                        onTap: _selectLocation,
                        child: Row(
                          children: const [
                            Icon(
                              Icons.location_on,
                              color: Color.fromRGBO(88, 101, 242, 1.0),
                            ),
                            SizedBox(width: 16),
                            Text(
                              'Location',
                              style: TextStyle(
                                color: Color.fromRGBO(88, 101, 242, 1.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Raise Funds'),
                      Switch(
                        value: _raiseFunds,
                        onChanged: _toggleRaiseFunds,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (_raiseFunds) _createPostButton(),
                  if (!_raiseFunds) _createPostButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createPostButton() {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: _nextAction,
        child: Text(_raiseFunds ? 'Next' : 'Post'),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.blue.shade200;
            } else if (states.contains(MaterialState.disabled)) {
              return Colors.grey;
            }
            return const Color.fromRGBO(88, 101, 242, 1.0);
          }),
        ),
      ),
    );
  }
}
