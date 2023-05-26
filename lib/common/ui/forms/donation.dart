// ignore_for_file: library_private_types_in_public_api, unused_field, sort_child_properties_last, unused_element, avoid_print, use_build_context_synchronously

import 'package:companion_app/common/ui/forms/uploadFile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

import '../../controller/posts_controller.dart';
import '../../models/posts.dart';

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
    //
  }

  void _toggleRaiseFunds(bool value) {
    setState(() {
      _raiseFunds = value;
    });
  }

  Future<void> _createPost() async {
    //
    if (_postText != null && _postText!.isNotEmpty) {
      Post newPost = Post(
        id: 0,
        description: _postText!,
        long_des: 'Dummy long description',
        imgUrl: 'https://example.com/image.jpg',
        userId: 789,
        location: 'Dummy location',
        likes: 0, //
        time: DateTime.now().toString(),
        raisedAmount: 0,
        totalAmount: 0,
        contributors: [],
        images: [],
      );

      try {
        // Add the new post to the JSON server
        Post createdPost = await PostController().createPost(newPost);
        print('Created post: $createdPost');
        // Show a success message or perform other actions as needed
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Post created successfully'),
            duration: Duration(seconds: 1),
          ),
        );
      } catch (e) {
        print('Error creating post: $e');
        // Show an error message or perform error handling as needed
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to create post'),
            duration: Duration(seconds: 1),
          ),
        );
      }
    } else {
      // Handle case where post text is empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a post description'),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  void _nextAction() {
    if (_raiseFunds) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const UploadFilePage(),
        ),
      );
    } else {
      _createPost();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none_outlined,
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
        elevation: 0,
        backgroundColor: const Color.fromRGBO(88, 101, 242, 1.0),
        title: Text(
          'COMPANION',
          style: GoogleFonts.raleway(
            fontWeight: FontWeight.bold,
            fontSize: 22.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.white,
              child: Container(
                color: const Color.fromRGBO(88, 101, 242, 1.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: Container(
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
                        Expanded(
                          child: Center(
                            child: Text(
                              'Create Post',
                              style: TextStyle(
                                color: const Color.fromRGBO(88, 101, 242, 1.0),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: GoogleFonts.raleway().fontFamily,
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
                ),
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
                          decoration: InputDecoration(
                            hintText: 'Want to start a charity?',
                            hintStyle: TextStyle(
                                fontFamily: GoogleFonts.raleway().fontFamily),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      const Divider(
                        color: Colors.grey,
                      ),
                      GestureDetector(
                        onTap: _selectPhotos,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/images.svg',
                              height: 25,
                            ),
                            const SizedBox(width: 16),
                            const Text(
                              'Photos',
                              style: TextStyle(
                                color: Color.fromRGBO(88, 101, 242, 1.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      GestureDetector(
                        onTap: _selectVideos,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/video.svg',
                              height: 25,
                            ),
                            const SizedBox(width: 16),
                            const Text(
                              'Videos',
                              style: TextStyle(
                                color: Color.fromRGBO(88, 101, 242, 1.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      GestureDetector(
                        onTap: _selectLocation,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/location.svg',
                              height: 25,
                            ),
                            const SizedBox(width: 16),
                            const Text(
                              'Location',
                              style: TextStyle(
                                color: Color.fromRGBO(88, 101, 242, 1.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Raise Funds',
                        style: TextStyle(
                          fontFamily: GoogleFonts.raleway().fontFamily,
                          fontWeight: FontWeight.w800,
                          color: const Color.fromRGBO(88, 101, 242, 1.0),
                        ),
                      ),
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
      width: 250,
      child: ElevatedButton(
        onPressed: _nextAction,
        child: Text(
          _raiseFunds ? 'Next' : 'Post',
          style: TextStyle(
            fontFamily: GoogleFonts.raleway().fontFamily,
            fontWeight: FontWeight.w800,
          ),
        ),
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
